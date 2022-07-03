# Copyright 2022 Delano Lourenco
# https://github.com/3ddelano/dataclasses-godot
# MIT License
# See License.md

class_name Dataclass, "res://addons/dataclasses-godot/DataclassIcon.svg"
extends Reference

const __DEFAULT_OPTIONS__ = {
	# Whether to sort properties when printing
	"sort_keys": true,

	# Whether to include properties with null values in the to_dict() method
	"include_null_in_dict": true,

	# Whether to include properties with null values when printing
	"include_null_in_print": true,

	# Whether to print properties on newlines when printing
	"print_newline": false,
}


var __name__: String
var __options__: Dictionary


func _init(p_name: String, p_options: Dictionary = {}):
	__name__ = p_name
	__options__ = __DEFAULT_OPTIONS__.duplicate()

	# Override options
	for key in p_options:
		__options__[key] = p_options[key]

	return self


func from_dict(p_dict: Dictionary):
	for key in p_dict:
		if not key in self:
			printerr("Dataclass:from_dict: Error: Key \"%s\" not found in dataclass \"%s\"" % [key, __name__])
			return

		# Check for types match
		var typeof_expected = typeof(get(key))
		var typeof_received = typeof(p_dict[key])
		if typeof_expected != TYPE_NIL and typeof_received != typeof_expected:
			printerr("Dataclass:from_dict: Warning: Key \"%s\" has type %s but expected type %s in dataclass \"%s\"" % [key, __type_to_string(typeof_received) , __type_to_string(typeof_expected), __name__])
		set(key, p_dict[key])

	return self


func to_dict() -> Dictionary:
	var ret = {}
	var all_props = __get_props()
	for prop in all_props:
		var value = get(prop.name)
		if value != null or __options__.include_null_in_dict:
			ret[prop.name] = value

	return ret


func get_class() -> String:
	return __name__


func __get_props() -> Array:
	var all_props = get_property_list()
	all_props.pop_front()
	all_props.pop_front()
	all_props.pop_front()
	all_props.pop_front()
	all_props.pop_front()

	if __options__.sort_keys:
		all_props.sort()

	return all_props

func __type_to_string(p_type: int) -> String:
	var types = ["NIL", "BOOL", "INT", "REAL", "STRING", "VECTOR2", "RECT2", "VECTOR3", "TRANSFORM2D", "PLANE", "QUAT", "AABB", "BASIS", "TRANSFORM", "COLOR", "NODE_PATH", "RID", "OBJECT", "DICTIONARY", "ARRAY", "RAW_ARRAY", "INT_ARRAY", "REAL_ARRAY", "STRING_ARRAY", "VECTOR2_ARRAY", "VECTOR3_ARRAY", "COLOR_ARRAY", "MAX"]
	return types[p_type]


func _to_string() -> String:
	var all_props = __get_props()

	var props = PoolStringArray()
	for prop in all_props:
		var value = get(prop.name)
		if value != null or __options__.include_null_in_print:
			props.append("%s=%s" % [prop.name, get(prop.name)])

	var separator = ", "
	var newline = ""
	var newline_end = ""
	if __options__.print_newline:
		newline = "\n\t"
		newline_end = "\n"
	return __name__ + "(" + newline + props.join(separator + newline) + newline_end + ")"

extends Control

# A sample Dataclass
class MyClass:
	extends Dataclass
	func _init().("MyClass"): pass

	# Compulsory
	var some_int: int
	var some_array: Array

	# Optional
	var optional_dict = null


func _ready():
	var obj = MyClass.new()
	obj.optional_dict = {foo = "bar"}

	# Better printing of objects
	print(obj)

	# Create object from Dictionary
	print(MyClass.new().from_dict({
		some_int = 123456789
	}))

	# Serialize to Dictionary
	var obj2 = MyClass.new().from_dict({some_array = [1,2,3,4, 5]})
	print(obj2.to_dict())


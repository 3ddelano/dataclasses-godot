extends Control


# A basic Dataclass
class MyClass extends Dataclass:
	func _init().("MyClass", {print_newline = true}): return self

	# Compulsory
	var some_int: int
	var some_array: Array

	# Optional
	var optional_dict = null


# A Dataclass with nested objects
class AnotherClass extends Dataclass:
	func _init().("AnotherClass", {print_newline = true}): return self

	var dict = {
		dict2 = {
			dict3 = {
				int1 = 42,
				dict4 = {
					class_ = MyClass.new()
				}
			}
		}
	}


# A sample class to showcase printing variables of all types
class PrintingTest extends Dataclass:
	func _init().("PrintingTest", {
		sort_keys = false,
		print_newline = true
	}): return self

	var var1 = null
	var var2 = true
	var var3 = 124
	var var4 = 70.129
	var var5 = "some string \n with newlines and \t tabs"
	var var6 = Vector2(1, 2)
	var var7 = Rect2(Vector2(1, 2), Vector2(10.2, 21.1))
	var var8 = Vector3(1.9, 1.2, 3.1)
	var var9 = Transform2D(12, Vector2(1, 0))
	var var10 = Plane(0.1, 0.2, -1.2, -1.2)
	var var11 = Quat(Vector3(1, 2, 3))
	var var12 = AABB(Vector3(1,2,3), Vector3(9, -1, 1.0))
	var var13 = Basis(var11)
	var var14 = Transform(var11)
	var var15 = Color(0.1, 0.2, 0.3)
	var var16 = NodePath("Test")
	var var17 = null # rid
	var var18 = Object()
	var var19 = { name = "123", num = 123, real = 1.23}
	var var20 = [1, "asd", 12.2, {name = "key"}]
	var var21 = PoolByteArray([1,2,1,2,2,2,1,2,3,32,3,12323,12,3,123,123,123,23,123,13,1231,23,12,132])
	var var22 = PoolIntArray([1,2,3,23,1312,3,12312,312,321,321,312,312,312,312,321,321,312,321,312,32,41,42343,24])
	var var23 = PoolRealArray([12.2, 31.2, 7.5])
	var var24 = PoolStringArray(["a", "b", "d", "with \nnewline\tand tabs"])
	var var25 = PoolVector2Array([Vector2(1,3), Vector2(9, 1.0)])
	var var26 = PoolVector3Array([Vector3(1,2,3), Vector3(9, -1, 1.0)])
	var var27 = PoolColorArray([Color("#222"), Color(123465)])
	var var28 = MyClass.new()
	var dict1 = {
		nested_dataclass = MyClass.new(),
		dict2 = {
			int1 = 1,
			dict3 = {
				str1 = "hello",
				int1 = 42,
				nested_dataclass = AnotherClass.new()
			}
		},
		nested_var_arr = [1.2, MyClass.new(), {str1 = "hello"}, [1, "string", 1.2]],
		nested_var_arr2 = [1.2,  [1, "string", 1.2], 9.899999999]
	}
	var nodes = []


# Customizing options for multiple classes
# Extend the Dataclass
class CustomDataclass extends Dataclass:

	func _init(p_name = "AlwaysPrintNewlineDataclass").(p_name, {
		sort_keys = false,
		print_newline = true,
		# ... etc any other options for
	}): return self


# Use the custom Dataclass
class SomeClass extends CustomDataclass:
	func _init().("SomeClass"): return self

	var str1 = "hey"
	var int1 = 12345
	var arr1 = [1, "hello", 8.1]
	var empty_dict = {}


func _ready():

	# Better printing of objects
	var obj = MyClass.new()
	obj.optional_dict = {foo = "bar"}
	print(obj)


	# Create object from Dictionary
	print(MyClass.new().from_dict({
		some_int = 123456789
	}))


	# Serialize to Dictionary
	var obj2 = MyClass.new().from_dict({some_array = [1,2,3,4, 5]})
	print(obj2.to_dict())


	# Printing test
	var print_test = PrintingTest.new()
	print_test.nodes.append_array([$Node, $Spatial, $Control, $Node2D])
	print(print_test)


	# Using a custom Dataclass
	print(SomeClass.new())

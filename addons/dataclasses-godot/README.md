Dataclasses Godot Plugin
=========================================
###### (Get it from Godot Asset Library - Coming soon)


### Easy to use dataclasses with helpful features
#### (similar to Python's dataclasses)

<img alt="Godot3" src="https://img.shields.io/badge/-Godot 3.x-478CBF?style=for-the-badge&logo=godotengine&logoWidth=20&logoColor=white" />
<br>
<img alt="Dataclasses logo" src="https://raw.githubusercontent.com/3ddelano/dataclasses-godot/main/logo.png" />



Features
--------------

- Customization options
- Create object from Dictionary
- Serialize to Dictionary
- Better printing of object



Installation
--------------

Copy the contents of `addons/dataclasses-godot` into the `addons/` folder in the same directory as your project.
(You dont need to enable the plugin in ProjectSettings)



Quick Start
----------

```GDScript
# Main.gd
extends Control

class MyClass:
	extends Dataclass
	func _init().("MyClass"): pass

	# Compulsory
	var some_int: int
	var some_array: Array

	# Optional
	var optional_dict = null


func _ready():
	# Better printing of objects
	var obj = MyClass.new()
	obj.optional_dict = {foo = "bar"}
	print(obj)

	# Create object from Dictionary
	print(MyClass.new().from_dict({some_int = 123456789}))

	# Serialize to Dictionary
	print(MyClass.new().from_dict({some_array = [1,2,3,4, 5]}).to_dict())
```



Documentation
----------

## Class: Dataclass

### Properties
| Type   | Name         | Defaults                                  | Description                                     |
| ------ | ------------ | ----------------------------------------- | ----------------------------------------------- |
| String | \__name__    | ""                                        | Name of the class to display when printing      |
| String | \__options__ | Default values mentioned in Customization | Options to customize behaviour of the dataclass |

### Methods

| Returns    | Definition                  | Description                    |
| ---------- | --------------------------- | ------------------------------ |
| self       | from_dict(dict: Dictionary) | Create object from Dictionary  |
| Dictionary | to_dict()                   | Serialize object to Dictionary |



Customization
----------

- **sort_keys**: true 
  
  Whether to sort properties when printing
- **include_null_in_dict**: true
  
  Whether to include properties with null values in the to_dict() method
- **include_null_in_print**: true
  
  Whether to include properties with null values when printing
- **print_newline**: false
  
  Whether to print properties on newlines when printing

<img src="https://raw.githubusercontent.com/3ddelano/dataclasses-godot/main/_assets/quick_start_output.png">



Customization Examples
----------

- Print properties of the object on newline
	```GDScript
	# Main.gd
	class MyClass:
		extends Dataclass
		func _init().("MyClass", {print_newline = true}): pass

		var some_int: int
		var some_array: Array
	
	func _ready():
		print(MyClass.new())
	```
	<img src="https://raw.githubusercontent.com/3ddelano/dataclasses-godot/main/_assets/print_newline_output.png">

#### Run res://sample/Sample.tscn for an example


Other Projects
----------

- Want to make Discord Bots in Godot? Use [discord.gd](https://github.com/3ddelano/discord.gd)
- Add multiplayer and stats with [Epic Online Services Godot](https://github.com/3ddelano/epic-online-services-godot)
- Show your Godot Editor in your Discord Presence using [this plugin](https://github.com/3ddelano/godot-editor-discord-presence)

### Support the project development
<a href="https://www.buymeacoffee.com/3ddelano" target="_blank"><img height="41" width="174" src="https://cdn.buymeacoffee.com/buttons/v2/default-red.png" alt="Buy Me A Coffee" width="150" ></a>

Want to support in other ways? Contact me on Discord: `@3ddelano#6033`

For doubts / help / bugs / problems / suggestions do join: [3ddelano Cafe](https://discord.gg/FZY9TqW) Discord server

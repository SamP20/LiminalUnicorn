extends Node2D

func _ready():
	position.y -= ProjectSettings.get_setting("display/window/size/height")/2

	print(position)
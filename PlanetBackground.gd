extends Control

func _ready():
	rect_position.x = -ProjectSettings.get_setting("display/window/size/width")/2
	rect_position.y = -ProjectSettings.get_setting("display/window/size/height")/2
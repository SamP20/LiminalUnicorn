extends Sprite

func _ready():
	position.x = 0
	position.y = ProjectSettings.get_setting("display/window/size/height") - texture.get_height()/2
	flip_h = true


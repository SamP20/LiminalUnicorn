extends Sprite

var look_forward
var move_speed = 5

func _ready():
	position.x = 0
	position.y = ProjectSettings.get_setting("display/window/size/height") - texture.get_height()/2
	look_forward = true

func _physics_process(delta):
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	if bool(move_direction):
		look_forward = move_direction + 1
		flip_h = look_forward
		position.x += move_direction * move_speed
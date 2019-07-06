extends Sprite

signal player_move

var look_forward

func _ready():
	position.x = 0
	position.y = ProjectSettings.get_setting("display/window/size/height") - texture.get_height()/2
	flip_h = true

func _physics_process(delta):
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	if bool(move_direction):
		emit_signal("player_move", move_direction, delta)
		look_forward = move_direction + 1
		flip_h = look_forward
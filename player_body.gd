extends KinematicBody2D

var move_speed = 10
var adjacent_to
var is_on_quest = false

func _physics_process(delta):
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	var velocity = Vector2(move_direction * move_speed, 0)
	if bool(move_direction):
		get_node("person").flip_h = move_direction + 1
	move_and_collide(velocity * delta * 10)
	
func set_adjacent_to(location):
	adjacent_to = location
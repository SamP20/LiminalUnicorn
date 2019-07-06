extends KinematicBody2D

var move_speed = 100
var adjacent_to = null
var quest_progress

func _ready():
	quest_progress = 0

func _physics_process(delta):
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	var velocity = Vector2(move_direction * move_speed, 0)
	if bool(move_direction):
		get_node("person").flip_h = move_direction + 1
	move_and_collide(velocity * delta * 10)
	
	if Input.is_action_just_pressed("action_primary"):
		interact_with_location()

func set_adjacent_to(location):
	adjacent_to = location
	
func interact_with_location():
	if adjacent_to:
		if adjacent_to.has_method("player_interact"):
			quest_progress = adjacent_to.player_interact(quest_progress)
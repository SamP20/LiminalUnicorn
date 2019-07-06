extends KinematicBody2D

signal change_visible

var move_speed = 5

func _on_person_player_move(move_direction, delta):
	var velocity = Vector2(move_direction * move_speed, 0)
	var collision_info = move_and_collide(velocity * delta * 10)

func _on_building_body_entered(body):
	print("Entered")
	emit_signal("change_visible", true)


func _on_building_body_exited(body):
	print("Exited")
	emit_signal("change_visible", false)

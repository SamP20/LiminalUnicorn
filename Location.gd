extends Area2D

func _on_area2D_body_entered(body):
	if(body.has_method("set_adjacent_to")):
		body.set_adjacent_to(self)
	get_node("buildinglabel").percent_visible = 1
	pass
	
func _on_area2D_body_exited(body):
	if(body.has_method("set_adjacent_to")):
		body.set_adjacent_to(null)
	get_node("buildinglabel").percent_visible = 0
	pass
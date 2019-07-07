extends Area2D

export var quest_location = false
export var quest_item = false
export var vista_location = false
export(Array, int) var quest_progression

func _on_area2D_body_entered(body):
	if(body.has_method("set_adjacent_to")):
		body.set_adjacent_to(self)
		if quest_location:
			get_node("label").bbcode_text = get_node("label").strings[body.quest_progress]
	get_node("label").percent_visible = 1
	pass
	
func _on_area2D_body_exited(body):
	if(body.has_method("set_adjacent_to")):
		body.set_adjacent_to(null)
	get_node("label").percent_visible = 0
	pass
	
func player_interact(player_quest_progress):
	if quest_location:
		var new_progress
		match player_quest_progress:
			0:
				new_progress = quest_progression[0]
			1:
				if quest_item:
					get_node("Sprite").visible = false
				new_progress = quest_progression[1]
			2:
				new_progress = quest_progression[2]
			3:
				new_progress = quest_progression[3]
		get_node("label").bbcode_text = get_node("label").strings[new_progress]
		return new_progress
	return player_quest_progress
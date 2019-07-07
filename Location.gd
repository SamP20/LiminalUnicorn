extends Area2D

enum LOCATIONTYPE{QUESTGIVER,QUESTITEM,VISTA,SPACESHIP}

export(LOCATIONTYPE) var location_type
export(Array, int) var quest_progression

func _on_area2D_body_entered(body):
	var player_progress = get_parent().get_node("Player").quest_progress
	
	get_node("label").bbcode_text = get_node("label").strings[player_progress]
	if(body.has_method("set_adjacent_to")):
		body.set_adjacent_to(self)
		if location_type == LOCATIONTYPE.QUESTGIVER:
			get_node("label").bbcode_text = get_node("label").strings[body.quest_progress]
	get_node("label").percent_visible = 1
	pass
	
func _on_area2D_body_exited(body):
	if(body.has_method("set_adjacent_to")):
		body.set_adjacent_to(null)
	get_node("label").percent_visible = 0
	pass
	
func player_interact(player_quest_progress):
	var new_progress
	if location_type == LOCATIONTYPE.QUESTGIVER || location_type == LOCATIONTYPE.QUESTITEM:
		match player_quest_progress:
			0:
				new_progress = quest_progression[0]
			1:
				if location_type == LOCATIONTYPE.QUESTITEM:
					get_node("Sprite").visible = false
				new_progress = quest_progression[1]
			2:
				new_progress = quest_progression[2]
			3:
				new_progress = quest_progression[3]
			_:
				new_progress = player_quest_progress
	if location_type == LOCATIONTYPE.VISTA:
		new_progress = 4
	if location_type == LOCATIONTYPE.SPACESHIP:
		new_progress = 0
		get_parent().scene_transitioner.pop_scene(
			get_parent().planet_goodbye
		)
		
	get_node("label").bbcode_text = get_node("label").strings[new_progress]
	return new_progress
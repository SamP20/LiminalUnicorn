extends Node2D

var scene_transitioner = null

export var planet_gravity = 800 
export var planet_goodbye = ""

func _ready():
	Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREA_PARAM_GRAVITY, planet_gravity)

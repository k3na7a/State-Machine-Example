class_name LevelManager extends Node

@export var player_manager : PlayerManager

func _ready() -> void : 
	player_manager.add_player_instance( self )

func _process(_delta:float) -> void :
	var player = player_manager.player
	
	var camera = get_viewport().get_camera_2d()
	
	var screenlimitR : float = camera.get_screen_center_position().x + player.get_viewport_rect().size.x / camera.zoom.x / 2 - 7
	var screenlimitL : float = camera.get_screen_center_position().x - player.get_viewport_rect().size.x / camera.zoom.x / 2 + 7
	var screenlimitBottom : float = get_viewport().get_camera_2d().limit_bottom + 100
	
	player.global_position.x = clamp(player.global_position.x, screenlimitL, screenlimitR)
	
	if player.global_position.y > screenlimitBottom : get_tree().reload_current_scene()

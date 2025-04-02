class_name ScreenClampComponent
extends Node

func handle_player_off_screen_x(character:CharacterBody2D) -> void :
	var camera = character.get_viewport().get_camera_2d()
	var screenlimitR : float = camera.get_screen_center_position().x + character.get_viewport_rect().size.x / camera.zoom.x / 2 - 7
	var screenlimitL : float = camera.get_screen_center_position().x - character.get_viewport_rect().size.x / camera.zoom.x / 2 + 7
	
	character.global_position.x = clamp(character.global_position.x, screenlimitL, screenlimitR)

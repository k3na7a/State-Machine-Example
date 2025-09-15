class_name CameraControlComponent
extends Node

@export var character : Entity

func is_off_camera_x(camera:Camera2D) -> bool :
	var screenlimitR : float = camera.get_screen_center_position().x + character.get_viewport_rect().size.x / camera.zoom.x / 2 - 10
	var screenlimitL : float = camera.get_screen_center_position().x - character.get_viewport_rect().size.x / camera.zoom.x / 2 + 10
	return true if character.position.x <= screenlimitL or character.position.x >= screenlimitR else false

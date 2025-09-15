class_name PlayerManager extends Node

@export var player_spawn : Marker2D

const PLAYER = preload("res://Scenes/Player/Player.tscn")

var player : Player

func _ready() -> void :
	for child in get_children() : 
		if child is Marker2D : add_player_instance(child.global_position)

func _process(_delta:float) -> void :
	var camera = get_viewport().get_camera_2d()
	
	var screenlimitR : float = camera.get_screen_center_position().x + player.get_viewport_rect().size.x / camera.zoom.x / 2 - 7
	var screenlimitL : float = camera.get_screen_center_position().x - player.get_viewport_rect().size.x / camera.zoom.x / 2 + 7
	
	player.global_position.x = clamp(player.global_position.x, screenlimitL, screenlimitR)
	
	if player.global_position.y > get_viewport().get_camera_2d().limit_bottom + 100 : get_tree().reload_current_scene()

func add_player_instance(position:Vector2) -> void :
	player = PLAYER.instantiate()
	player.global_position = position
	add_child(player)

class_name PlayerManager extends Node

@export var player_spawn : Marker2D
const PLAYER = preload("res://Scenes/Player/Player.tscn")

var player : Player

signal character_status(character:Player)

func add_player_instance(level:LevelManager) -> void :
	player = PLAYER.instantiate()
	
	player.character_status.connect(emit_status)
	player.global_position = player_spawn.global_position
	
	level.add_child(player)

func emit_status(character:Player) -> void :
	emit_signal("character_status", character)

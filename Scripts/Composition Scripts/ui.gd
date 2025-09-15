class_name UserInterfaceLayer
extends CanvasLayer

signal player_status(character:Player)

@export var dev_hud_active : bool = true
@export var dev_hud : Control

func _ready() -> void : 
	dev_hud.show() if dev_hud_active else dev_hud.hide()

func _on_player_manager_character_status(character:Player) -> void : 
	emit_signal("player_status", character)

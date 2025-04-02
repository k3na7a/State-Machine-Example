class_name DamageComponent
extends Node

@export var damage : float

func get_damage() -> float : return damage
func set_damage(payload:float) -> void : damage = payload

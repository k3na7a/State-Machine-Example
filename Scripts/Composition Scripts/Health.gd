class_name HealthComponent
extends Node

@export var max_health 	: float
@export var health 		: float

func damage(attack: Attack) -> void : health -= attack.attack_damage

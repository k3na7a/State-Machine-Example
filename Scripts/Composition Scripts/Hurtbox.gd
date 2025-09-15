class_name HurtboxComponent
extends Area2D

@export_group('References')
@export var health_component 	: HealthComponent
@export_group('Child References')
@export var collisionShape		: CollisionShape2D

func damage(attack: Attack) -> void: 
	if health_component : health_component.damage(attack)

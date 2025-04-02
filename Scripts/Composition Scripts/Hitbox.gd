class_name HitboxComponent
extends Area2D

@export_group('References')
@export var damage_component 	: DamageComponent
@export_group('Child References')
@export var collisionShape		: CollisionShape2D

func _area_entered(area) -> void : 
	if area is HurtboxComponent && area.get_parent() is CharacterBody2D:
		area.damage(damage_component.damage)

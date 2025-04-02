class_name GravityComponent
extends Node

@export var base_gravity 	: float = ProjectSettings.get_setting("physics/2d/default_gravity") 
@export var velocity 		: float

@onready var gravity 		: float = base_gravity

func apply_gravity(character:CharacterBody2D, delta:float) -> void :
	character.velocity.y = move_toward(character.velocity.y, gravity, delta * gravity)
	velocity = character.velocity.y

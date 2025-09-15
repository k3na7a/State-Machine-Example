class_name VelocityComponent
extends Node

@export var max_velocity 		: float
@export var velocity 			: float

@export var ground_acceleration : float
@export var ground_friction 	: float

@export var air_acceleration 	: float
@export var air_friction 		: float

var is_accelerating

func handle_horizontal_movement(character: CharacterBody2D, direction:float, delta:float) -> void :
	var acceleration = (ground_acceleration if character.is_on_floor() else air_acceleration) * delta
	var deceleration = (ground_friction if character.is_on_floor() else air_friction) * delta
	
	is_accelerating = not direction == 0.0 and sign(direction) == sign(character.velocity.x)
	
	character.velocity.x = move_toward(character.velocity.x, max_velocity * sign(direction), acceleration if is_accelerating else deceleration)
	velocity = character.velocity.x

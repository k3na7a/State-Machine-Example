class_name JumpComponent
extends Node

@export var jump_height_px 		: float
@export var jump_time_to_peak 	: float

@export var coyote_time_sec		: float

@onready var jump_gravity		: float = ((-2.0 * jump_height_px) / (jump_time_to_peak * jump_time_to_peak)) * -1
@onready var jump_velocity 		: float = ((2.0 * jump_height_px) / jump_time_to_peak) * -1

var coyote_time		: bool = false
var is_on_floor 	: bool = false

func handle_jump(character: CharacterBody2D) -> void :
	coyote_time = false
	
	character.input_bus.buffered_action = character.input_bus.ACTION.NULL
	character.velocity.y = jump_velocity

func handle_coyote_time(character: CharacterBody2D) -> void :
	if is_on_floor and not character.is_on_floor() and character.velocity.y > 0 :
		coyote_time = true
		get_tree().create_timer(coyote_time_sec).timeout.connect(_coyote_timeout)
	elif character.is_on_floor() : coyote_time = false
	is_on_floor = character.is_on_floor()

func _coyote_timeout() -> void : coyote_time = false

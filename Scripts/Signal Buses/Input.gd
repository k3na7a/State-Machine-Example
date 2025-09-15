class_name Input_Bus
extends Node

enum ACTION { NULL, JUMP, ATTACK, ACTION }

var input_right			: float 	= 0.0
var input_left			: float 	= 0.0
var input_up			: float 	= 0.0
var input_down			: float 	= 0.0

var input_jump			: bool 		= false
var input_action		: bool 		= false
var input_attack		: bool 		= false
var input_options		: bool		= false

var input_buffer_time 	: float 	= 0.2
var buffered_action 	: ACTION 	= ACTION.NULL

func _process(_delta:float) -> void:
	input_right 	= Input.get_action_strength("Right")
	input_left 		= Input.get_action_strength("Left")
	input_up 		= Input.get_action_strength("Up")
	input_down 		= Input.get_action_strength("Down")
	input_jump 		= Input.is_action_pressed("Jump")
	input_attack 	= Input.is_action_pressed("Attack")
	input_action	= Input.is_action_pressed("Action")
	input_options 	= Input.is_action_pressed("Options")

func get_axis() -> float: return input_right - input_left

func buffer_input(action:ACTION) -> void :
	if not buffered_action == action :
		buffered_action = action
		get_tree().create_timer(input_buffer_time).timeout.connect(_buffer_timeout)
func _buffer_timeout() -> void : buffered_action = ACTION.NULL

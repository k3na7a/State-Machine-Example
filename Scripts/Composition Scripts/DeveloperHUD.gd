extends Control

@export var parent : UserInterfaceLayer
@export_group("Labels")
@export_subgroup("Status")
@export var status_header 			: Label
@export var current_state_label 	: Label
@export var health_label 			: Label
@export var velocity_label 			: Label
@export var is_on_floor_label 		: Label
@export var is_accelerating_label	: Label
@export var is_coyote_time_label	: Label
@export_subgroup("Input")
@export var input_header 			: Label
@export var input_up_label 			: Label
@export var input_right_label 		: Label
@export var input_down_label 		: Label
@export var input_left_label 		: Label
@export var input_jump_label 		: Label
@export var input_attack_label 		: Label
@export var input_action_label 		: Label
@export var input_buffered_label	: Label

func _ready() -> void :
	if parent.dev_hud_active : init()

func init() -> void :
	show()
	parent.connect("player_status", on_update)

func on_update(character: Player) -> void :
	status_header.text 			= "Player Status".to_upper()
	current_state_label.text 	= "- Current State : %s" 		% character.state_machine.current_state.name.to_upper()
	health_label.text 			= "- Health : %06.2f/%06.2f" 	% [character.health_node.health, character.health_node.max_health]
	velocity_label.text 		= "- Velocity : %06.2v" 		% abs(character.velocity)
	
	is_on_floor_label.text 		= "- Is On Floor : %s" 			% str(character.is_on_floor()).to_upper()
	is_accelerating_label.text 	= "- Is Accelerating : %s" 		% str(character.movement_node.is_accelerating).to_upper()
	is_coyote_time_label.text 	= "- Is Coyote Time : %s" 		% str(character.jump_node.coyote_time).to_upper()
	
	input_header.text			= "Input Display".to_upper()
	
	input_up_label.text 		= "- Up : %.1f" 				% character.input_bus.input_up
	input_down_label.text 		= "- Down : %.1f" 				% character.input_bus.input_down
	input_left_label .text 		= "- Left : %.1f" 				% character.input_bus.input_left
	input_right_label.text 		= "- Right : %.1f"				% character.input_bus.input_right
	
	input_jump_label .text 		= "- Jump : %s" 				% str(character.input_bus.input_jump).to_upper()
	input_attack_label.text 	= "- Attack : %s" 				% str(character.input_bus.input_attack).to_upper()
	input_action_label.text 	= "- Action : %s" 				% str(character.input_bus.input_action).to_upper()
	
	input_buffered_label.text 	= "- Buffered Input : %s"		% str(character.input_bus.ACTION.keys()[character.input_bus.buffered_action])

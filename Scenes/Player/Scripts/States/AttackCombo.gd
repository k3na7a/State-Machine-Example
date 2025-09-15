extends PlayerState

var attack_complete : float
var attack_buffer	: bool
var combo_attack	: bool = false

func enter() -> void :
	super()
	
	attack_complete = false

func exit() -> void :
	super()
	
	combo_attack 	= false
	attack_buffer 	= false

func process_input(event:InputEvent) -> State :
	super(event)
	
	if event.is_action_pressed("Attack") : attack_buffer = true
	return null

func process_physics(delta:float) -> State :
	super(delta)
	
	if attack_complete :
		if not character.is_on_floor() 		: return state_machine.states["fall"]
		elif combo_attack or attack_buffer 	: return state_machine.states["attackheavy"]
		else : return state_machine.states["idle"] if character.input_bus.get_axis() == 0.0 else state_machine.states["run"]
	return null


func _on_animation_player_animation_finished(anim_name:String) :
	if anim_name == animation_name : attack_complete = true

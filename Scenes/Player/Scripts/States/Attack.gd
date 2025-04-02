extends PlayerState

var attack_complete : bool
var combo_attack 	: bool
var triple_attack	: bool

func enter() -> void :
	super()
	
	attack_complete = false
	combo_attack = false

func process_input(event:InputEvent) -> State :
	super(event)
	
	if event.is_action_pressed("Attack") : combo_attack = true
	return null

func process_physics(delta:float) -> State :
	super(delta)
	
	var dir_held : bool = not InputBus.get_axis() == 0.0
	if attack_complete :
		if combo_attack 				: return state_machine.states["attackcombo"]
		elif not character.is_on_floor() 	: return state_machine.states["fall"]
		else : return state_machine.states["idle"] if not dir_held else state_machine.states["run"]
	return null

func animation_complete(anim:String) -> void : if anim == animation_name : attack_complete = true


func _on_animation_player_animation_finished(anim_name:String) :
	if anim_name == animation_name : attack_complete = true

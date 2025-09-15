extends PlayerState

var attack_complete : bool
var direction : int

func enter() -> void :
	super()
	
	direction = -1 if character.sprite.flip_h else 1
	attack_complete = false
	
	character.velocity.x += 150 * direction

func process_physics(delta:float) -> State :
	super(delta)
	
	if attack_complete :
		if !character.is_on_floor() : return state_machine.states["fall"]
		else : return state_machine.states["idle"] if InputBus.get_axis() == 0.0 else state_machine.states["run"]
	return null

func _on_animation_player_animation_finished(anim_name:String) -> void :
	if anim_name == animation_name : attack_complete = true

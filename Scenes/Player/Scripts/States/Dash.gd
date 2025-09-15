extends PlayerState

var attack_complete = false

@export var dash_speed : int

func enter() -> void :
	super()
	
	attack_complete = false

func exit() -> void :
	super()

func process_input(event:InputEvent) -> State :
	super(event)
	
	if event.is_action_pressed("Jump") : return state_machine.states["jump"]
	elif event.is_action_pressed("Attack") : return state_machine.states["attackheavy"]
	return null

func process_physics(_delta:float) -> State :
	# var direction = -1 if character.sprite.flip_h else 1
	var dir_held : bool = not character.input_bus.get_axis() == 0.0
	
	#character.velocity.x = velocity_component.velocity * direction
	
	character.move_and_slide()
	
	if attack_complete:
		if not character.is_on_floor() : return state_machine.states["fall"]
		else : return state_machine.states["idle"] if not dir_held else state_machine.states["run"]
	return null

func _on_player_animation_complete(anim_name:String) -> void  : 
	if anim_name == animation_name : attack_complete = true

extends PlayerState

func process_input(event:InputEvent) -> State :
	super(event)
	
	if event.is_action_pressed("Attack") : return state_machine.states["attack"]
	elif event.is_action_pressed("Jump") : 
		if character.jump_node.coyote_time : return state_machine.states["jump"]
		else : character.input_bus.buffer_input(character.input_bus.ACTION.JUMP)
	return null

func process_physics(delta:float) -> State :
	super(delta)
	
	var dir_held : bool = not character.input_bus.get_axis() == 0
	
	if character.is_on_floor() : 
		if character.input_bus.buffered_action == character.input_bus.ACTION.JUMP : return state_machine.states["jump"] 
		else : return state_machine.states["idle"] if not dir_held else state_machine.states["run"]
	return null

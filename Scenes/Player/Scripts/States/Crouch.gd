extends PlayerState

func process_input(event:InputEvent) -> State :
	super(event)
	
	if event.is_action_pressed("Jump") : return state_machine.states["jump"]
	return null

func process_physics(delta:float) -> State :
	super(delta)
	
	if !character.is_on_floor() : return state_machine.states["fall"]
	elif not character.input_bus.get_axis() == 0.0 : return state_machine.states["run"]
	elif character.input_bus.input_down == 0 : return state_machine.states["idle"]
	return null

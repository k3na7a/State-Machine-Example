extends PlayerState

var base_gravity 	: float
var jump_impeded 	: bool
var timer			: float

func enter() -> void :
	super()
	
	timer = 0.1
	jump_impeded = false
	base_gravity = character.gravity_node.gravity
	
	character.gravity_node.gravity = character.jump_node.jump_gravity
	character.jump_node.handle_jump(character)

func exit() -> void :
	super()
	
	character.gravity_node.gravity = base_gravity

func process_input(event:InputEvent) -> State :
	super(event)
	
	if event.is_action_pressed("Attack") : 
		handle_impede_jump()
		return state_machine.states["attack"]
	return null

func process_physics(delta:float) -> State :
	super(delta)
	
	timer -= delta
	
	if not character.input_bus.input_jump and not jump_impeded and timer <= 0: handle_impede_jump()
	
	if character.velocity.y > 0 : return state_machine.states["fall"]
	return null

func handle_impede_jump() -> void :
		jump_impeded = true
		
		character.velocity.y *= 0.3
		character.gravity_node.gravity = base_gravity

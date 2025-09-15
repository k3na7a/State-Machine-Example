class_name GoombaState
extends State

@export var idle_state 			: GoombaState
@export var move_state			: GoombaState

@export var velocity_component 	: VelocityComponent
@export var gravity_component	: GravityComponent

@export var sprite_offset			: Vector2 = Vector2(0, 0)

func enter() -> void :
	super()
	
	var direction = -1 if sprite.flip_h else 1
	sprite.offset = Vector2(sprite_offset.x * direction, sprite_offset.y)
	character.play_animation(animation_name)

func process_physics(delta:float) -> State :
	super(delta)
	
	# if direction != 0.0 : character.flip_sprite(direction)
	# velocity_component.handle_horizontal_movement(direction)
	gravity_component.apply_gravity(character, delta)
	
	character.move_and_slide()
	
	return null

extends GoombaState

@export var goomba					: Goomba
@export var bi_directional_raycast 	: BiDirectionalRaycastComponent

func enter() -> void:
	# move_character.set_speed(move_character.move_speed)
	super()

func update(delta:float) -> GoombaState :
	# var is_colliding : int = bi_directional_raycast.is_colliding()
	# if not is_colliding == 0 : move_character.set_direction(-is_colliding)
	return super(delta)

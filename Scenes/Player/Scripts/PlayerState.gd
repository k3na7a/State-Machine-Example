class_name PlayerState extends State

@export_group("State Variables")
@export var animation_name	: String
@export var has_control		: bool
@export var sprite_offset	: Vector2 = Vector2(5.5, 0)
@export var sound_effect 	: AudioStream

func enter() -> void :
	super()
	
	var dir = -1 if character.sprite.flip_h else 1
	
	if sound_effect 	: play_sfx(sound_effect)
	if animation_name 	: play_animation(animation_name)
	
	character.sprite.offset = Vector2(sprite_offset.x * dir, sprite_offset.y)

func process_physics(delta:float) -> State :
	super(delta)
	
	var direction : float = character.input_bus.get_axis() if has_control else 0.0
	if direction != 0.0 : character.sprite.flip_sprite(direction)
	
	character.jump_node.handle_coyote_time(character)
	character.movement_node.handle_horizontal_movement(character, direction, delta)
	character.gravity_node.apply_gravity(character, delta)
	
	character.move_and_slide()
	
	return null

func play_sfx(sfx:AudioStream) -> void :
	var audio_player = AudioStreamPlayer2D.new()
	
	add_child(audio_player)
	
	audio_player.finished.connect(audio_player.queue_free)
	audio_player.stream = sfx
	audio_player.play()

func play_animation(animation:String) -> void : character.sprite.play_animation(animation)

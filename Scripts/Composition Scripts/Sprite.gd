class_name SpriteComponent
extends Sprite2D

@export var animation_player : AnimationPlayer

signal animation_complete(animation_name:String)

func play_animation(animation_name:String) -> void : animation_player.play(animation_name)
func stop_animation() -> void : animation_player.stop()

func flip_sprite(direction:float) -> void :
	flip_h = (direction == -1)
	offset.x = direction * abs(offset.x)

func _ready() -> void : animation_player.animation_finished.connect(_on_animation_complete)
func _on_animation_complete(animation_name:String) -> void : emit_signal("animation_complete", animation_name)

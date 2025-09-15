class_name Goomba
extends CharacterBody2D

@export var scene 				: Node
@export var state_machine 		: StateMachineComponent
@export var sprite				: Sprite2D
@export var animation_player 	: AnimationPlayer

signal animation_complete(animation_name:String)

func _ready() -> void : 
	animation_player.animation_finished.connect(_on_animation_complete)
	state_machine.init()
func _process(delta:float) -> void : state_machine.process(delta)
func _physics_process(delta:float) -> void : state_machine.physics_process(delta)
func _unhandled_input(event:InputEvent) -> void : state_machine.unhandled_input(event)

func play_animation(animation_name:String) -> void : animation_player.play(animation_name)
func stop_animation() -> void : animation_player.stop()

func flip_sprite(direction:float) -> void :
	sprite.flip_h = (direction == -1)
	sprite.offset.x = direction * abs(sprite.offset.x)

func _on_animation_complete(animation_name:String) -> void:
	emit_signal("animation_complete", animation_name)

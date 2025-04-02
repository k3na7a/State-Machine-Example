class_name Entity
extends CharacterBody2D

@export var state_machine 	: StateMachineComponent

func _ready() 							-> void : state_machine.init(self)
func _process(delta:float) 				-> void : state_machine.process(delta)
func _physics_process(delta:float) 		-> void : state_machine.physics_process(delta)
func _unhandled_input(event:InputEvent)	-> void : state_machine.unhandled_input(event)


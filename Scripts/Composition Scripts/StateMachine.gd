class_name StateMachineComponent
extends Node

@export var states_node 	: Node
@export var starting_state 	: State

var current_state 	: State
var states 			: Dictionary = {}

signal changed_state(new_state:State)

func change_state(new_state:State) -> void :
	emit_signal("changed_state", new_state)
	if current_state : current_state.exit()
	current_state = new_state
	current_state.enter()

func init(character:CharacterBody2D) -> void : 
	for child in get_children() : 
		if child is State : 
			child.state_machine = self
			child.character = character
			states[child.name.to_lower()] = child
	change_state(starting_state)

func physics_process(delta:float) -> void :
	var new_state = current_state.process_physics(delta)
	if new_state: change_state(new_state)

func unhandled_input(event:InputEvent) -> void :
	var new_state = current_state.process_input(event)
	if new_state: change_state(new_state)

func process(delta:float) -> void :
	var new_state = current_state.update(delta)
	if new_state: change_state(new_state)

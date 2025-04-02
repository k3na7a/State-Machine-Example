class_name State
extends Node

static var character		: CharacterBody2D
static var states 			: Dictionary = {}
static var state_machine	: StateMachineComponent

func enter() 	-> void: pass
func exit() 	-> void: pass

func update(_delta:float)				-> State: return null
func process_input(_event: InputEvent) 	-> State: return null
func process_physics(_delta: float) 	-> State: return null

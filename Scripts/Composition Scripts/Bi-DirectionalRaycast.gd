class_name BiDirectionalRaycastComponent
extends Node2D

@export var RCastL : RayCast2D
@export var RCastR : RayCast2D

func is_colliding() -> int:
	if RCastR.is_colliding() && RCastL.is_colliding() : return 1
	elif RCastR.is_colliding() : return 1
	elif RCastL.is_colliding() : return -1
	else : return 0

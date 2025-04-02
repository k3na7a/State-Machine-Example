class_name Player
extends Entity

@export_group("Character Nodes")
@export var collision_shape	: CollisionShape2D
@export var sprite			: SpriteComponent
@export_group("Composition Nodes")
@export var gravity_node	: GravityComponent
@export var movement_node	: VelocityComponent
@export var jump_node		: JumpComponent
@export var health_node		: HealthComponent
@export var input_bus		: InputBus

signal character_status(character:Player)

func _physics_process(delta:float) -> void : 
	super(delta)
	emit_signal("character_status", self)

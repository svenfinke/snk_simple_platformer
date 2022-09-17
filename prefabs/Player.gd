extends CharacterBody2D

const UP_DIRECTION: Vector2 = Vector2.UP

@onready var  animation_mode = $AnimationTree.get("parameters/playback")

@export var speed: float = 100.0
@export var jump_strength: float = 300.0
@export var gravity: float = 450.0

var _velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var is_jumping: bool = (Input.is_action_just_pressed("ui_select") || Input.is_action_just_pressed("ui_up")) and is_on_floor()
	var is_jumping_cancelled: bool = (Input.is_action_just_released("ui_select") || Input.is_action_just_released("ui_up"))and _velocity.y < 0.0
	var on_floor: bool = is_on_floor()
	
	# Horizontal Movement
	_velocity.x = 0
	if Input.is_action_pressed("ui_left"):
		_velocity.x = -speed
		animation_mode.travel("Run")
	elif Input.is_action_pressed("ui_right"):
		_velocity.x = speed
		animation_mode.travel("Run")
	else:
		animation_mode.travel("Idle")
	
	#Vertical Movement
	if _velocity.y > 0:
		_velocity.y += gravity * 2 * delta
	else:
		_velocity.y += gravity * delta
		
	if is_jumping:
		_velocity.y = -jump_strength
	elif is_jumping_cancelled:
		_velocity.y = 0.0
	
	# Animation
	$AnimationTree.set('parameters/Run/blend_position', _velocity.x)
	$AnimationTree.set('parameters/Idle/blend_position', _velocity.x)
	
	# Pass Movement
	set_velocity(_velocity)
	set_up_direction(UP_DIRECTION)
	move_and_slide()
	_velocity = velocity

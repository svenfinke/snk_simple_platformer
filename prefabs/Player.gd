extends CharacterBody2D

const UP_DIRECTION: Vector2 = Vector2.UP

@onready var  animation_mode = $AnimationTree.get("parameters/playback")

@export var gravity: float = 450.0

const SPEED = 150.0
const JUMP_VELOCITY = -450.0

var externalForce: Vector2 = Vector2.ZERO
var _velocity: Vector2 = Vector2.ZERO

func _ready():
	GlobalGameScript.healthChanged.connect(_on_healthChanged)
	GlobalGameScript.scoreChanged.connect(_on_scoreChanged)

func _physics_process(delta: float) -> void:

#
#	# Horizontal Movement
#	if Input.is_action_pressed("ui_left"):
#		_velocity.x -= speed
#		animation_mode.travel("Run")
#	elif Input.is_action_pressed("ui_right"):
#		_velocity.x += speed
#		animation_mode.travel("Run")
#	elif Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right"):
#		_velocity.x = 0
#		animation_mode.travel("Idle")
#	else:
#		animation_mode.travel("Idle")
#
#	_velocity.x = clamp(_velocity.x, -speed, speed)
#
#	#Vertical Movement
#	if _velocity.y > 0:
#		_velocity.y += gravity * 2 * delta
#	else:
#		_velocity.y += gravity * delta
#
#
#	# Pass Movement
#	set_velocity(_velocity)
#	set_up_direction(UP_DIRECTION)
#	if move_and_slide():
#		_handle_collsions()
#
#	_velocity = velocity
	var is_jumping: bool = (Input.is_action_just_pressed("ui_select") || Input.is_action_just_pressed("ui_up")) and is_on_floor()
	var is_jumping_cancelled: bool = (Input.is_action_just_released("ui_select") || Input.is_action_just_released("ui_up"))and _velocity.y < 0.0
	var is_thrown: bool = externalForce != Vector2.ZERO

	# Add the gravity.
	if not is_on_floor():
		if velocity.y < 0:
			velocity.y += gravity * delta * 2
		else:
			velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x += direction * SPEED
		velocity.x = clamp(velocity.x, -SPEED, SPEED)
		animation_mode.travel("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.x == 0:
		animation_mode.travel("Idle")

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if is_jumping:
		velocity.y = JUMP_VELOCITY
		$Jump.playing = true
	elif is_jumping_cancelled:
		velocity.y = 0.0
	elif is_thrown:
		velocity = velocity + externalForce
		externalForce = Vector2.ZERO
		$Jump.playing = true
	
	# Animation
	$AnimationTree.set('parameters/Run/blend_position', velocity.x)
	$AnimationTree.set('parameters/Idle/blend_position', velocity.x)

	set_up_direction(UP_DIRECTION)
	if move_and_slide():
		_handle_collsions()

func _handle_collsions() -> void:
	# Player collided with something
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if collision.get_collider().has_method("handle_player_collision"):
				collision.get_collider().handle_player_collision(self)

# SIGNALS
func _on_healthChanged(oldValue, newValue):
	if (oldValue > newValue) && newValue > 0:
		$AnimationPlayer.play("hit")
		$Hurt.playing = true
	else:
		$Hearth.playing = true

func _on_scoreChanged() -> void:
	$Coin.playing = true

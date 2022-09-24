extends CharacterBody2D

@export var gravity: float = 450.0
@export var doDamage: bool = false
@onready var animation_mode = $AnimationTree.get("parameters/playback")

func _on_detection_range_body_entered(body) -> void:
	animation_mode.travel("angry")

func _on_detection_range_body_exited(body):
	animation_mode.travel("peaceful")

func handle_player_collision(player) -> void:
	if doDamage:
		GlobalGameScript.health -= 1

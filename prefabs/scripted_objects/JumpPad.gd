extends StaticBody2D

@export var canTrigger: bool = true
@export var padVelocity: int = -300

func handle_player_collision(player: CharacterBody2D) -> void:
	if !canTrigger:
		return
	
	player.externalForce = Vector2(0, padVelocity)
	$AnimationPlayer.play("jump")

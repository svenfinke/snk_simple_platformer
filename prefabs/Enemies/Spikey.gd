extends CharacterBody2D

const PUSH_BACK_VELOCITY = 100

func handle_player_collision(player: CharacterBody2D) -> void:
	GlobalGameScript.health -= 2

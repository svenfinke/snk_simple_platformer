extends StaticBody2D

func handle_player_collision(player: CharacterBody2D) -> void:
	GlobalGameScript.health -= 1

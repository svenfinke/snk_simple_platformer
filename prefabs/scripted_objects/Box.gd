extends StaticBody2D

func handle_player_collision(player: CharacterBody2D) -> void:
	var playerCollisionShape = player.get_node("CollisionShape2D")
	var playerHalfHeigth = playerCollisionShape.shape.size.y / 2
	var playerHalfWidth = playerCollisionShape.shape.size.x / 2
	var boxHalfHeigth = $CollisionShape2d.shape.size.y / 2
	var boxHalfWidth = $CollisionShape2d.shape.size.x / 2
	
	# Break if not hit from below
	if player.global_position.y - playerHalfHeigth < global_position.y + boxHalfHeigth:
		return
	
	# Break if x is not within box
	if player.global_position.x + playerHalfWidth < global_position.x - boxHalfWidth || player.global_position.x - playerHalfWidth > global_position.x + boxHalfWidth:
		return
	
	handle_box_hit()

func handle_box_hit() -> void:
	if $Sprite2d.frame_coords.y == 0:
		$Sprite2d.frame_coords.y = 1
		GlobalGameScript.score += 100

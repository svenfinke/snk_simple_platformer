extends Area2D

func _ready():
	var initialPosition = position
	var tween = get_tree().create_tween()
	tween.set_loops()
	tween.tween_property(self, "position", initialPosition + Vector2(15,0), 1)
	tween.tween_property(self, "position", initialPosition + Vector2(-15,0), 2)
	tween.tween_property(self, "position", initialPosition, 1)


func _on_Birdie_body_entered(body):
	if body.global_position.y < global_position.y:
		$AnimationPlayer.play("Die")
		await get_tree().create_timer(0.7).timeout
		queue_free()
	else:
		GlobalGameScript.health -= 2
	

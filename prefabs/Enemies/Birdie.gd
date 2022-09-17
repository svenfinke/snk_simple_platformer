extends Area2D

func _ready():
	var initialPosition = position
	var tween = get_tree().create_tween()
	tween.set_loops()
	tween.tween_property(self, "position", initialPosition + Vector2(15,0), 1)
	tween.tween_property(self, "position", initialPosition + Vector2(-15,0), 2)
	tween.tween_property(self, "position", initialPosition, 1)


func _on_Birdie_body_entered(body):
	GlobalGameScript.health -= 2

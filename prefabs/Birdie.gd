extends Area2D

func _ready():
	var initialPosition = position
	var tween = $Tween
	tween.interpolate_property(self, "position", initialPosition, initialPosition + Vector2(30,0), 2,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0.2)
	tween.interpolate_property(self, "position", initialPosition + Vector2(30,0), initialPosition, 2,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 2.4)
	tween.start()


func _on_Birdie_body_entered(body):
	GlobalGameScript.health -= 1

extends Area2D

func _on_Coin_body_entered(body):
	GlobalGameScript.score += 100
	queue_free()

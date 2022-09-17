extends Area2D

func _on_hearth_body_entered(body):
	GlobalGameScript.health += 2
	queue_free()

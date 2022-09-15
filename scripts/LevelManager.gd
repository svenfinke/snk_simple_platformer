extends Node2D

export(String) var nextScene: String

func _on_FinishLine_body_entered(body):
	get_tree().change_scene(nextScene)

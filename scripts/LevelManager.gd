extends Node2D

@export var nextScene: String	

func _process(_delta) -> void:
	GlobalGameScript.currentLevel = get_tree().current_scene.scene_file_path
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().reload_current_scene()

func _on_FinishLine_body_entered(body):
	get_tree().change_scene_to_file(nextScene)

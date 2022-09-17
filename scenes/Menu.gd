extends CanvasLayer

@export var firstLevel: PackedScene

func _on_Start_pressed():
	get_tree().change_scene_to_packed(firstLevel)

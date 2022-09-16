extends CanvasLayer

export(PackedScene) var firstLevel: PackedScene

func _on_Start_pressed():
	get_tree().change_scene_to(firstLevel)

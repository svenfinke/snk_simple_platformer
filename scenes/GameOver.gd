extends CanvasLayer

func _ready():
	var tween = self.create_tween()
	tween.tween_property($Label, "position", $Label.position + Vector2(0, 100), 3)

func _on_restart_game_pressed():
	GlobalGameScript.restart()

func _on_restart_level_pressed():
	GlobalGameScript.restart(false)

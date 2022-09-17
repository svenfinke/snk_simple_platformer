extends PathFollow2D

@export var roundtripTimeInSeconds: int = 5

func _ready():
	var tween = get_tree().create_tween()
	tween.set_loops()
	tween.tween_property(self, "progress_ratio", 1, roundtripTimeInSeconds / 2)
	tween.tween_property(self, "progress_ratio", 0, roundtripTimeInSeconds / 2)

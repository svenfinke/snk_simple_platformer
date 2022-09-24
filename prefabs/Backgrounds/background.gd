extends CanvasLayer

@export var faded_out: bool = false

func _set_faded_out(value: bool) -> void:
	faded_out = value

func fade_out() -> void:
	if faded_out:
		return
		
	var tween = get_tree().create_tween()
	tween.tween_property($Top, 'modulate', Color(1,1,1,0), 2)
	tween.parallel().tween_property($Bottom, 'modulate', Color(1,1,1,0), 2)
	tween.parallel().tween_property($Center, 'modulate', Color(1,1,1,0), 2)
	tween.chain()
	tween.tween_callback(_set_faded_out.bind(true))

func fade_in() -> void:
	if !faded_out:
		return
		
	var tween = get_tree().create_tween()
	tween.tween_property($Top, 'modulate', Color(1,1,1,1), 2)
	tween.parallel().tween_property($Bottom, 'modulate', Color(1,1,1,1), 2)
	tween.parallel().tween_property($Center, 'modulate', Color(1,1,1,1), 2)
	tween.chain()
	tween.tween_callback(_set_faded_out.bind(false))

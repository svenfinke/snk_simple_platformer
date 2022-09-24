extends Node2D

func _process(delta):
	if $Player.global_position.y < -200:
		$Background_Grass.fade_out()
	else:
		$Background_Grass.fade_in()
	

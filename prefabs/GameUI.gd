extends CanvasLayer

func _process(_delta:float) -> void:
	$Points.text = "Points: " + str(GlobalGameScript.score)

	var health = GlobalGameScript.health
	
	#Hearth_01
	$Hearth_01.frame_coords.x = 4
	if health <= 1:
		$Hearth_01.frame_coords.x = 5
	
	#Hearth_02
	$Hearth_02.frame_coords.x = 4
	if health == 3:
		$Hearth_02.frame_coords.x = 5
	elif health <= 2:
		$Hearth_02.frame_coords.x = 6
	
	#Hearth_03
	$Hearth_03.frame_coords.x = 4
	if health == 5:
		$Hearth_03.frame_coords.x = 5
	elif health <= 4:
		$Hearth_03.frame_coords.x = 6
	

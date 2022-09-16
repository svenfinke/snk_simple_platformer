extends Node

onready var menuScene = load("res://scenes/Menu.tscn")

var score: int = 0
var health: int = 6
var initialHealth: int = 6

func _process(_delta) -> void:
	if health <= 0:
		reset()

func reset() -> void:
	health = initialHealth
	score = 0
	get_tree().change_scene_to(menuScene)

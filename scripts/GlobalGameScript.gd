extends Node

@onready var menuScene = load("res://scenes/Menu.tscn")

signal healthChanged(oldValue, newValue)
signal scoreChanged

var _score: int = 0
var score:
	get:
		return _score
	set(value):
		scoreChanged.emit()
		_score = value
var _health: int = 6
var health: 
	get:
		return _health
	set(value):
		healthChanged.emit(health, value)
		_health = value
var initialHealth: int = 6

func _process(_delta) -> void:
	if health <= 0:
		reset()

func reset() -> void:
	health = initialHealth
	score = 0
	get_tree().change_scene_to_packed(menuScene)

extends Node

@onready var menuScene = load("res://scenes/Menu.tscn")
@onready var gameOverScene = load("res://scenes/GameOver.tscn")

signal healthChanged(oldValue, newValue)
signal scoreChanged

var currentLevel: String
var vulnerable: bool = true

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
		if value < health:
			if vulnerable:
				vulnerable = false
				healthChanged.emit(health, value)
				_health = value
				await get_tree().create_timer(0.4).timeout
				vulnerable = true
			else:
				return
		else:
			healthChanged.emit(health, value)
			_health = value
var initialHealth: int = 6

func _process(_delta) -> void:
	if health <= 0:
		die()

func die() -> void:
	reset()
	get_tree().change_scene_to_packed(gameOverScene)

func reset(jumpToMenu: bool = true) -> void:
	health = initialHealth
	score = 0

func restart(jumpToMenu: bool = true) -> void:
	if jumpToMenu:
		get_tree().change_scene_to_packed(menuScene)
	else:
		get_tree().change_scene_to_file(currentLevel)

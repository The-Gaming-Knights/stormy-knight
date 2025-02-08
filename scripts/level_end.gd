extends Area2D

@onready var canvas_layer: Control = $CanvasLayer/Control
@onready var game: Node2D = $".."
@onready var player: CharacterBody2D = $"../level/Player"
var complete = false
@onready var music: AudioStreamPlayer = get_node("../musicforlevel("+str(Startgame.level)+")")

func _on_body_entered(_body):
	player.slow = false
	player.hide()
	complete = true
	music.stop()
	game.pause()
	$"Mixkit-futuristic-machine-starting-2689".play()
	canvas_layer.show()

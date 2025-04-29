extends Area2D

@onready var canvas_layer: Control = $CanvasLayer/Control
@onready var game: Node2D = $".."
@onready var player: CharacterBody2D = $"../level/Player"
var complete = false
@onready var music: AudioStreamPlayer = get_node("../musicforlevel("+str(Startgame.level)+")")

func _on_body_entered(_body):
	player.hide()
	complete = true
	game.pause()
	canvas_layer.show()

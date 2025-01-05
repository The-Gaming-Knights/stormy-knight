extends Area2D

@onready var canvas_layer: Control = $CanvasLayer/Control
@onready var game: Node2D = $".."



func _on_body_entered(body):
	game.pause()
	canvas_layer.show()

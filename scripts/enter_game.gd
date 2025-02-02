extends Control
@onready var play: Button = $ColorRect/CenterContainer/HBoxContainer/CenterContainer/VBoxContainer/Play
@onready var exit: Button = $ColorRect/CenterContainer/HBoxContainer/CenterContainer/VBoxContainer/Exit

func _on_play_pressed() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://scenes/first.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

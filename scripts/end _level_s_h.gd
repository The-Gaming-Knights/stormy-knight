extends Control

@onready var next_button := $"ColorRect/CenterContainer/VBoxContainer/next level" as Button
@onready var restart: Button = $ColorRect/CenterContainer/VBoxContainer/restart

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/grass_platform.tscn")
	
#func _on_restart_pressed() -> void:
	#Engine.time_scale = 1
	#get_tree().reload_current_scene()

func _ready() -> void:
	hide()

func open() -> void:
	print("opening")
	show()
	next_button.grab_focus()

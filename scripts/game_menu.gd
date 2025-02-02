class_name GameMenu extends Control


@export var fade_in_duration := 0.3
@export var fade_out_duration := 0.2

@onready var center_cont := $ColorRect/Container as CenterContainer
@onready var resume_button := $ColorRect/Container/VBoxContainer/Button2 as Button
@onready var exit_button := $ColorRect/Container/VBoxContainer/Button as Button
#@onready var coins_counter := $ColorRect/CoinsCounter as CoinsCounter
func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/enter_game.tscn")

func _ready() -> void:
	hide()
func _on_button_2_pressed() -> void:
	close()
func _on_restart_pressed() -> void:
	Engine.time_scale = 1
	get_tree().paused = false
	get_tree().reload_current_scene()

func close() -> void:
	print("closing")
	#var tween := create_tween()
	hide()
	get_tree().paused = false

func open() -> void:
	print("opening")
	show()
	resume_button.grab_focus()
	
func _on_resume_button_pressed() -> void:
	close()

func _on_quit_button_pressed() -> void:
	if visible:
		get_tree().quit()

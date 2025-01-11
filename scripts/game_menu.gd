class_name PauseMenu extends Control


@export var fade_in_duration := 0.3
@export var fade_out_duration := 0.2

@onready var center_cont := $ColorRect/Container as CenterContainer
@onready var resume_button := $ColorRect/Container/VBoxContainer/Button2 as Button
@onready var exit_button := $ColorRect/Container/VBoxContainer/Button as Button
#@onready var coins_counter := $ColorRect/CoinsCounter as CoinsCounter
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/grass_platform.tscn")

func _ready() -> void:
	hide()
func _on_button_2_pressed() -> void:
	close()


func close() -> void:
	print("closing")
	#var tween := create_tween()
	hide()
	get_tree().paused = false
	#tween.tween_property(
		#self,
		#^"modulate:a",
		#0.0,
		#fade_out_duration
	#).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
	#tween.parallel().tween_property(
		#center_cont,
		#^"anchor_bottom",
		#0.5,
		#fade_out_duration
	#).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	#tween.tween_callback(hide)


func open() -> void:
	print("opening")
	show()
	resume_button.grab_focus()
	#modulate.a = 0.0
	#center_cont.anchor_bottom = 0.5

	#var tween := create_tween()
	#tween.tween_property(
		#self,
		#^"modulate:a",
		#1.0,
		#fade_in_duration
	#).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	#tween.parallel().tween_property(
		#center_cont,
		#^"anchor_bottom",
		#1.0,
		#fade_out_duration
	#).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)



func _on_resume_button_pressed() -> void:
	close()

func _on_quit_button_pressed() -> void:
	if visible:
		get_tree().quit()

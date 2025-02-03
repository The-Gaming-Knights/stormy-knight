extends Control

@onready var next_button := $"ColorRect/CenterContainer/VBoxContainer/next level" as Button
@onready var restart: Button = $ColorRect/CenterContainer/VBoxContainer/restart
 
func _ready() -> void:
	print("ready",Startgame.level)
	hide()

func _on_button_pressed() -> void:
	Startgame.level += 1
	get_tree().change_scene_to_file("res://scenes/level"+str(Startgame.level)+".tscn")
	print("buttone",Startgame.level)
	
func _on_exit_pressed() -> void:
	get_tree().paused = false
	Startgame.level += 1
	get_tree().change_scene_to_file("res://scenes/enter_game.tscn")
	
func _on_restart_pressed() -> void:
	Engine.time_scale = 1
	get_tree().paused = false
	get_tree().reload_current_scene()


func open() -> void:
	print("opening")
	show()
	next_button.grab_focus()

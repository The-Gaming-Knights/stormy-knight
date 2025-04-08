extends Control

@onready var next_button := $"ColorRect/CenterContainer/VBoxContainer/next level" as Button
@onready var restart: Button = $ColorRect/CenterContainer/VBoxContainer/restart
@onready var label: Label = $ColorRect/CenterContainer/VBoxContainer/Label
@onready var bground: TextureRect = $TextureRect
@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	print("ready",Startgame.level)
	hide()
	bground.hide()
	if Startgame.level == Startgame.lastlevel:
		next_button.free()
		label.text = "  you win!"
		bground.show()
		color_rect.color = Color(.0,.0,.0,.0)

func _on_button_pressed() -> void:
	Startgame.level += 1
	if Startgame.level == 2:
		get_tree().change_scene_to_file("res://scenes/lorescreen.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/levels/level"+str(Startgame.level)+".tscn")
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
	

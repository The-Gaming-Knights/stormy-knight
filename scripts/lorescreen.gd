extends Control

func _ready() -> void:
	get_tree().paused = false
	Engine.time_scale = 1

func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level"+str(Startgame.level)+".tscn")
	print("buttone",Startgame.level)

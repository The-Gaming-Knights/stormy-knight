extends Control
@onready var play: Button = $ColorRect/CenterContainer/HBoxContainer/CenterContainer/VBoxContainer/Play
@onready var exit: Button = $ColorRect/CenterContainer/HBoxContainer/CenterContainer/VBoxContainer/Exit
@onready var player: TextureRect = $ColorRect/CenterContainer/HBoxContainer/ColorRect/HBoxContainer/TextureRect
@onready var prev: Button = $ColorRect/CenterContainer/HBoxContainer/ColorRect/HBoxContainer/prev
@onready var next: Button = $ColorRect/CenterContainer/HBoxContainer/ColorRect/HBoxContainer/next
@onready var counter: Label = $ColorRect/CenterContainer/HBoxContainer/CenterContainer/VBoxContainer/cheesecounter

func _on_play_pressed() -> void:
	Engine.time_scale = 1
	if Startgame.level == 2:
		get_tree().change_scene_to_file("res://scenes/lorescreen.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/levels/level"+str(Startgame.level)+".tscn")
		print("buttone",Startgame.level)
	
func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level1.tscn")
	Startgame.level = 1
	for i in range(len(Startgame.cheese)):
		Startgame.cheese[1] = false

func _on_exit_pressed() -> void:
	get_tree().quit()

func _ready() -> void:
	player.texture= ImageTexture.create_from_image(Image.load_from_file("res://assets/sprites/select/select"+str(Startgame.skin)+".png"))
	counter.hide()
	if Startgame.level == Startgame.lastlevel+1 :
		play.free()
	
func _process(delta: float) -> void:
	
	if true in Startgame.cheese :
		counter.show()
		counter.text = "cheese\ncolected\n"+str(Startgame.cheese.count(true))

func _on_prev_pressed() -> void:
	if Startgame.skin > 1:
		Startgame.skin -= 1
	elif Startgame.skin == 1:
		Startgame.skin = 13
	player.texture= ImageTexture.create_from_image(Image.load_from_file("res://assets/sprites/select/select"+str(Startgame.skin)+".png"))

func _on_next_pressed() -> void:
	if Startgame.skin < 13:
		Startgame.skin += 1
	elif Startgame.skin == 13:
		Startgame.skin = 1
	player.texture= ImageTexture.create_from_image(Image.load_from_file("res://assets/sprites/select/select"+str(Startgame.skin)+".png"))

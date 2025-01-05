extends Control

@onready var next_button := $ColorRect/CenterContainer/VBoxContainer/Button as Button

func _ready() -> void:
	hide()

func open() -> void:
	print("opening")
	show()
	next_button.grab_focus()

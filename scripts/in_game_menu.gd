extends Node

#@onready var _pause_menu: Control = $Control
@onready var _pause_menu: Control = $CanvasLayer/Control

func pause():
	get_tree().paused = not get_tree().paused

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause_or_exit"):
		var tree := get_tree()
		tree.paused = not tree.paused
		if tree.paused:
			print("paused")
			_pause_menu.open()
		else:
			print("unpaused")
			_pause_menu.close()
		get_tree().root.set_input_as_handled()
		

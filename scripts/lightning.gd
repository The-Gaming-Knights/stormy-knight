extends Node2D

@onready var timer: Timer = $Timer
@onready var timer2: Timer = $Timer2
@onready var sprite_2d: Sprite2D = $AnimatedSprite2D/Sprite2D
@onready var killzone: Area2D = $killzone

func _on_timer_timeout4seck() -> void:
	sprite_2d.show()
	print("showing")
	timer2.start()
	timer.stop()
	killzone.set_process_mode(Node.PROCESS_MODE_INHERIT)

func _on_timer_2_timeout1seck() -> void:
	sprite_2d.hide()
	print("timeout")
	timer2.stop()
	timer.start()
	killzone.set_process_mode(Node.PROCESS_MODE_DISABLED)

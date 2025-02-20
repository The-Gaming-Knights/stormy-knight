extends Area2D

@onready var timer: Timer = $Timer
var death = false

func _on_body_entered(body):
	Engine.time_scale = 0.5
	timer.start()
	death = true
	body.get_node("CollisionShape2D").queue_free()
	if Startgame.cheese_colected == true:
		Startgame.cheese -= 1
		Startgame.cheese_colected = false



func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()

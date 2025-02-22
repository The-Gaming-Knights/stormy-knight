extends Area2D



func _on_body_entered(body: Node2D) -> void:
	queue_free()
	Startgame.cheese[Startgame.level-1] = true

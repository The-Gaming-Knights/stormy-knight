extends Node2D

var speed = 80
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var player: CharacterBody2D = $"../Player"
@onready var node_2d: Node2D = $"."
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_2d.is_colliding():
		position.x = player.position.x + 200
		position.y = player.position.y - 200
	else:
		position.x -= speed * delta
		position.y += speed * delta

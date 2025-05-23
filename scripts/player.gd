extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var KILLZONE: Area2D = $"../killzone"
@onready var area_2d: Area2D = $"../../Area2D"
var movement = true
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var dead = false



func _physics_process(delta: float) -> void:
	if KILLZONE.death == true and dead == false:
		dead = true
		velocity.y = -300
	if Input.is_action_just_pressed("restart"):
		Engine.time_scale = 1
		get_tree().reload_current_scene()
			
	var direction := Input.get_axis("left", "right")
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle"+str(Startgame.skin))
		else:
			animated_sprite.play("run"+str(Startgame.skin))
	else:
		animated_sprite.play("jump_fall"+str(Startgame.skin))
	
	if movement:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

	if KILLZONE.death == false:	
		if Input.is_action_just_pressed("normal"):
			Engine.time_scale = 1
			
		if Input.is_action_just_pressed("slow2"):
			Engine.time_scale = 0.5



		if Input.is_action_just_pressed("slow3"):
			Engine.time_scale = 0.3


			
		if Input.is_action_just_pressed("slow4"):
			Engine.time_scale = 0.1

		
			
	move_and_slide()

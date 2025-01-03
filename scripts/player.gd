extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("slow0.5"):
		Engine.time_scale = 0.5
		
	if Input.is_action_just_pressed("slow0.3"):
		Engine.time_scale = 0.3
		
	if Input.is_action_just_pressed("slow0.25"):
		Engine.time_scale = 0.25
		
	if Input.is_action_just_pressed("normal"):
		Engine.time_scale = 1
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()

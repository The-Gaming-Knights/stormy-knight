extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var slow = false
@onready var timer2: Timer = $Timer


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			
	if slow == false:	
		if Input.is_action_just_pressed("normal"):
			Engine.time_scale = 1
			
		if Input.is_action_just_pressed("slow2"):
			Engine.time_scale = 0.5
			timer2.start()
			slow = true

		if Input.is_action_just_pressed("slow3"):
			Engine.time_scale = 0.3
			timer2.start()
			slow = true
			
		if Input.is_action_just_pressed("slow4"):
			Engine.time_scale = 0.1
			timer2.start()
			slow = true
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()
func _on_timer_timeout() -> void:
		Engine.time_scale = 1
		slow = false

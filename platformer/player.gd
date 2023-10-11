extends CharacterBody2D

const speed: float = 300.0
const jump_velocity: float = -250

var gravity: float = 350.5

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed('ui_up') and is_on_floor():
		velocity.y = jump_velocity
		
	var direction = Input.get_axis('ui_left', 'ui_right')
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	move_and_slide()

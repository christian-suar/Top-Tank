extends CharacterBody2D


const speed = 250
const rotation_speed = 1.5
# Get the gravity from the project settings to be synced with RigidBody nodes.

func _physics_process(delta):
	var move_input = Input.get_axis("ui_down", "ui_up")
	var rotation_direction = Input.get_axis("ui_left", "ui_right")
	velocity = transform.x * move_input * speed
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	

extends CharacterBody2D


const speed = 250
const rotation_speed = 1.2
var can_fire = true

@onready var shoot_spot = $Marker2D
@onready var bullet_scene = preload("res://scenes/biege_bullet.tscn")


func _physics_process(delta):
	var move_input = Input.get_axis("ui_down", "ui_up")
	var rotation_direction = Input.get_axis("ui_left", "ui_right")
	velocity = transform.x * move_input * speed
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	shoot_bullet()
	
	
	


func shoot_bullet():
	if Input.is_action_just_pressed("leftClick") and can_fire:
		var bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)
		bullet.global_position = shoot_spot.global_position
		bullet.global_rotation = shoot_spot.global_rotation

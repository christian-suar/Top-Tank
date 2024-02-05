extends CharacterBody2D


const speed = 250
const rotation_speed = 1.2
var can_fire = true
@onready var shoot_spot = $Marker2D
@onready var bullet_scene = preload("res://scenes/bulletbiege.tscn")
@onready var tileSet = $"../TileMap"

func _physics_process(delta):
	var move_input = Input.get_axis("ui_down", "ui_up")
	var rotation_direction = Input.get_axis("ui_left", "ui_right")
	velocity = transform.x * move_input * speed
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	if Input.is_action_just_pressed("leftClick") and can_fire:
		var bullet = bullet_scene
		bullet.position = shoot_spot.position
		print("pos done")
		bullet.velocity = Vector2(128,0)
		
		tileSet.add_child(bullet)
		can_fire = false
		await get_tree().create_timer(1).timeout
		can_fire = true


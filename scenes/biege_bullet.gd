extends CharacterBody2D

var speed = 300
var despawn = 5



func _ready():
	pass
	
func _process(delta):
	position += transform.x * speed * delta
	move_and_slide()

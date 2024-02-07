extends Area2D

var speed = 100.0
var despawn = 5
var direction = Vector2()


func _ready():
	direction = Vector2(cos(rotation),sin(rotation))
	
func _process(delta):
	position += direction * speed * delta

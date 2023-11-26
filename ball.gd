extends CharacterBody2D

@export var speed = 400

# Equivalent to Vector2(0,0)
var direction = Vector2.ZERO


func _ready():
	# On start, pick random direction for ball to travel in
	direction.x = [-1,1].pick_random()
	direction.y = [-1,1].pick_random()
	
func _physics_process(delta):
	
	if direction:
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
	
	# Accounting for when the ball collides with an object
	var collision_object = move_and_collide(direction * speed * delta)
	if collision_object:
		# A normal is the direction a specific surface is facing, we use the normal to bounce in the correct direction, use bounce method
		direction = direction.bounce(collision_object.get_normal())
	
func stop_ball():
	speed = 0

func restart_ball():
	speed = 400
	direction.x = [-1,1].pick_random()
	direction.y = [-1,1].pick_random()

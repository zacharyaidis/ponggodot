extends CharacterBody2D


@export var SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	
	# To ensure that the player paddle's x coordinate does not move
	position.x = 64
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D

@export var movementSpeed = 5

func _physics_process(delta):
	var currentLocation = global_position
	var nextLocation = nav_agent.get_next_path_position()
	var newVelocity = (nextLocation - currentLocation).normalized() * movementSpeed
	velocity = velocity.move_toward(newVelocity, 0.25)
	move_and_slide()

func updateTargetLocation(targetLocation):
	nav_agent.target_position = targetLocation

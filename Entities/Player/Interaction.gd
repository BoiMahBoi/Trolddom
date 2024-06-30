extends RayCast3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		if is_colliding(): 
			var collider = get_collider()
			print(collider)
			if collider is Node:
				if collider.is_in_group("Interactable"):
					collider.interact()

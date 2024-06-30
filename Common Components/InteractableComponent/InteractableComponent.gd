extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact():
	get_parent().interact()
	print("Interacted!")

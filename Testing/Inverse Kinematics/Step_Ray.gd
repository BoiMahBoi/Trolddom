extends RayCast3D

@export var stepTarget: Node3D

func _physics_process(delta):
	var hitPoint = get_collision_point()
	if hitPoint:
		stepTarget.global_position = hitPoint

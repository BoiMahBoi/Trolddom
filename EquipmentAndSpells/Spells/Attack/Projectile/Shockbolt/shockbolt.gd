extends Node3D

var speed = 100

func _physics_process(delta):
	position += transform.basis * Vector3(0, 0, -speed) * delta

func _on_area_3d_body_entered(body):
	print(body, " body")
	if body.is_in_group("hitbox"):
		get_parent().onImpact(body)
	queue_free()

func _on_area_3d_area_entered(area):
	print(area, " area")
	if area.is_in_group("hitbox"):
		get_parent().onImpact(area)
	queue_free()

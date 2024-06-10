extends Area3D

@export var health_component : Node3D

func takeDamage(damage):
	if health_component:
		health_component.takeDamage(damage)

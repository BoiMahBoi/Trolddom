extends Node3D

@export var destroyTimer = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start(destroyTimer)

func _on_timer_timeout():
	get_parent().queue_free()

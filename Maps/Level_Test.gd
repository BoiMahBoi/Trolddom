extends Node

@onready var player = $Player

func _physics_process(delta):
	if player != null:
		get_tree().call_group("enemies", "updateTargetLocation", player.global_transform.origin)

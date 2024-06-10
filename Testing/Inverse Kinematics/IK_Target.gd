extends Marker3D

@export var stepTarget: Node3D
@export var stepDistance: float = 3.0

@export var otherLeg: Node3D

var isStepping := false

func _process(delta):
	if !isStepping && !otherLeg.isStepping && abs(global_position.distance_to(stepTarget.global_position)) > stepDistance:
		step()

func step():
	var targetPos = stepTarget.global_position
	var halfWay = (global_position + stepTarget.global_position) / 2
	isStepping = true
	var t = get_tree().create_tween()
	t.tween_property(self, "global_position", halfWay + owner.basis.y, 0.1)
	t.tween_property(self, "global_position", targetPos, 0.1)
	t.tween_callback(func(): isStepping = false)


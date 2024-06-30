extends Node3D

@export var max_health = 100
@export var current_health = 100

@export var physicalResist = 10
@export var fireResist = 20
@export var frostResist = 0
@export var shockResist = 0
@export var curseResist = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health

func takeDamage(damage, damage_type):
	match damage_type:
		"physical":
			print("Physical damage")
			current_health -= (damage - (physicalResist * damage/100))
		"fire":
			print("Fire damage")
			current_health -= (damage - (fireResist * damage/100))
		"frost":
			print("Frost damage")
			current_health -= (damage - (frostResist * damage/100))
		"shock":
			print("Shock damage")
			current_health -= (damage - (shockResist * damage/100))
		"curse":
			print("Curse damage")
			current_health -= (damage - (curseResist * damage/100))
	checkHealth()

# Check if the current health is above 0. If not, delete the object.
func checkHealth():
	print("Remaining health: ", current_health)
	if current_health <= 0:
		get_parent().queue_free()

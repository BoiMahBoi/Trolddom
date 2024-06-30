extends Node3D

@export var spellName = "Curseball"
@export var spellDescription = "Fires a ball of curse"
@export var spellType = "Attack"
@export var keyCombination = ["up", "down", "up", "left", "right"]
@export var manaCost = 20
@export var damage = 20
@export var damageType = "curse"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Creates a new Node3D and adds it as a child. Loops through modifier spells to check if behavior should be changed.
func castSpell(modifierSpells, castPosition):
	var spell_node = load("res://EquipmentAndSpells/Spells/Projectiles/" + spellName + "/" + spellName + ".tscn").instantiate()
	add_child(spell_node)
	spell_node.position = castPosition.global_position
	spell_node.rotation = castPosition.global_rotation
	print(spellName + " casted!")

func onImpact(impact_point):
	if impact_point.get_parent().get_node("HealthComponent"):
		impact_point.get_parent().get_node("HealthComponent").takeDamage(20, damageType)

extends Node3D

@export var spellName = "Shockball"
@export var spellDescription = "Fires a ball of electricity"
@export var spellType = "Attack"
@export var keyCombination = ["left", "left", "left", "left", "right"]
@export var manaCost = 20
@export var damage = 20
@export var damageType = "shock"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func castSpell(modifierSpells, castPosition):
	var spell_node = load("res://EquipmentAndSpells/Spells/AttackSpells/Shockball/shockball.tscn").instantiate()
	add_child(spell_node)
	spell_node.position = castPosition.global_position
	spell_node.rotation = castPosition.global_rotation
	print(spellName + " casted!")

func onImpact(enemy):
	enemy.get_node("HealthComponent").takeDamage(20, damageType)

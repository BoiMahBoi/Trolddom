extends Node3D

@export var spellName = "Frostbolt"
@export var spellDescription = "Fires a bolt of frost"
@export var spellType = "Attack"
@export var keyCombination = ["down", "down", "up", "left", "right"]
@export var manaCost = 20
@export var damage = 20
@export var damageType = "frost"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func castSpell(modifierSpells, castPosition):
	var spell_node = load("res://EquipmentAndSpells/Spells/AttackSpells/Frostbolt/frostbolt.tscn").instantiate()
	add_child(spell_node)
	spell_node.position = castPosition.global_position
	spell_node.rotation = castPosition.global_rotation
	print(spellName + " casted!")

func onImpact(enemy):
	enemy.get_node("HealthComponent").takeDamage(20, damageType)

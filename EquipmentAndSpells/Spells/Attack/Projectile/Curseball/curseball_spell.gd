extends Node3D

@export var spell_name = "Curseball"
@export var spell_description = "Fires a ball of curse"
@export var spell_category = "Attack"
@export var spell_sub_category = "Projectile"
@export var key_combination = ["up", "down", "up", "left", "right"]
@export var mana_cost = 20
@export var damage = 20
@export var damage_type = "curse"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Creates a new Node3D and adds it as a child. Loops through modifier spells to check if behavior should be changed.
func castSpell(modifierSpells, castPosition):
	var spell_node = load("res://EquipmentAndSpells/Spells/" + spell_category + "/" + spell_sub_category + "/" + spell_name + "/" + spell_name + ".tscn").instantiate()
	add_child(spell_node)
	spell_node.position = castPosition.global_position
	spell_node.rotation = castPosition.global_rotation
	print(spell_name + " casted!")

func onImpact(impact_point):
	if impact_point.get_parent().get_node("HealthComponent"):
		impact_point.get_parent().get_node("HealthComponent").takeDamage(20, damage_type)

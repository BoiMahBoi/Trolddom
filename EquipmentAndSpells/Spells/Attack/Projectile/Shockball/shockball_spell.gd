extends Node3D

@export var spell_name = "Shockball"
@export var spell_description = "Fires a ball of electricity"
@export var spell_category = "Attack"
@export var spell_sub_category = "Projectile"
@export var key_combination = ["left", "left", "left", "left", "right"]
@export var mana_cost = 20
@export var damage = 20
@export var damage_type = "shock"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func castSpell(modifierSpells, castPosition):
	var spell_node = load("res://EquipmentAndSpells/Spells/" + spell_category + "/" + spell_sub_category + "/" + spell_name + "/" + spell_name + ".tscn").instantiate()
	add_child(spell_node)
	spell_node.position = castPosition.global_position
	spell_node.rotation = castPosition.global_rotation
	print(spell_name + " casted!")

func onImpact(impact_point):
	if impact_point.get_parent().get_node("HealthComponent"):
		impact_point.get_parent().get_node("HealthComponent").takeDamage(20, damage_type)

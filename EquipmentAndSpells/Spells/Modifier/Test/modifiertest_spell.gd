extends Node3D

@export var spell_name = "ModifierTest"
@export var spell_description = "Modifies the previous spell"
@export var spell_category = "Modifier"
@export var spell_sub_category = "Test"
@export var key_combination = ["left", "down", "down", "left", "right"]
@export var mana_cost = 0
@export var damage = 0
@export var damage_type = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Creates a new Node3D and adds it as a child. Loops through modifier spells to check if behavior should be changed.
func castSpell(modifierSpells, castPosition):
	print(spell_name + " casted! modifier")
	
func modifySpell(spell):
	print("Modified: ", spell)

func onImpact():
	pass

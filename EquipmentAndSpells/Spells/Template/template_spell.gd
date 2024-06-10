extends Node3D

@export var spellName = ""
@export var spellDescription = ""
@export var spellType = ""
@export var keyCombination = ["", "", "", "", ""]
@export var manaCost = 0
@export var damage = 0
@export var damageType = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Creates a new Node3D and adds it as a child. Loops through modifier spells to check if behavior should be changed.
func castSpell(modifierSpells, castPosition):
	print(spellName + " casted!")

func onImpact():
	pass

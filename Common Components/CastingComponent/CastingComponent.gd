extends Node3D

var pressedKeys = ["null","null","null","null","null"]
var currentKey = 0

var spellsReady = [null, null, null, null, null, null]
var currentSpell = 0

var castingPositions = [null, null, null, null, null, null]
@onready var castingPoints = $"../Head/CastingPoints"

var maxReadyingMana = 120
var currentReadyingMana = maxReadyingMana
var maxMana = maxReadyingMana
var currentMana = maxMana
var manaGenerationRate = 1

@onready var spellBook = %KnownSpells
var knownSpells : Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	castingPositions = castingPoints.get_children()
	updateKnownSpells()
	print("Max mana: ", maxMana)
	print("Current mana: ", currentMana)

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	# If the cast button is pressed, go through and cast the readied spells.
	if Input.is_action_just_pressed("CastSpells"):
		var i = 0
		for chosenSpell in spellsReady:
			if chosenSpell != null:
				# If the spell is a modifier spell, iterate backwards in the array until another spell is reached.
				if chosenSpell.spellType == "Modifier":
					for p in range(i,-1,-1):
						if spellsReady[p].spellType != "Modifier":
							chosenSpell.modifySpell(spellsReady[p])
							break
				else:
					# If the spell is not a modifier spell, and there is enough mana to cast it, cast the spell.
					if currentMana > chosenSpell.manaCost:
						chosenSpell.castSpell(null, castingPositions[i])
						currentMana = currentMana - chosenSpell.manaCost
				i = i + 1

	if Input.is_action_just_pressed("unready_spell"):
		if currentKey > 0:
			pressedKeys[currentKey - 1] = "null"
			currentKey = currentKey - 1
			print(pressedKeys)
		elif currentKey == 0 && spellsReady.size() > 0:
			currentReadyingMana += spellsReady[currentSpell - 1].manaCost
			spellsReady[currentSpell - 1] = null
			currentSpell -= 1
			print(spellsReady)
	
	if Input.is_action_just_pressed("key_up"):
		pressedKeys[currentKey] = "up"
		print(pressedKeys)
		nextKeyslot()
	
	if Input.is_action_just_pressed("key_down"):
		pressedKeys[currentKey] = "down"
		print(pressedKeys)
		nextKeyslot()
	
	if Input.is_action_just_pressed("key_left"):
		pressedKeys[currentKey] = "left"
		print(pressedKeys)
		nextKeyslot()
	
	if Input.is_action_just_pressed("key_right"):
		pressedKeys[currentKey] = "right"
		print(pressedKeys)
		nextKeyslot()
		
func _physics_process(delta):
	# Regenerate mana if the current mana is less than the maximum available mana
	if currentMana < maxMana:
		currentMana = ((currentMana + 1) * manaGenerationRate)
		#print(currentMana)

func nextKeyslot():
	currentKey = currentKey + 1
	if currentKey >= 5:
		print(pressedKeys)
		currentKey = 0
		readySpell()

func readySpell():
	var i = 0
	for spell in knownSpells:
		print(spell, spell.keyCombination)
		i = i + 1
		if spell.keyCombination == pressedKeys:
			if currentSpell < spellsReady.size():
				if currentReadyingMana >= spell.manaCost:
					spellsReady[currentSpell] = spell
					currentReadyingMana = currentReadyingMana - spell.manaCost
					print("Current mana: ", currentReadyingMana)
					currentSpell = currentSpell + 1
					break
				else:
					print("Not enough mana!")
			else:
				print("Can't ready more spells!")
	pressedKeys = ["null","null","null","null","null"]
	print(spellsReady)
	
func updateKnownSpells():
	knownSpells = spellBook.get_children()
	print("Known spells: ", knownSpells)

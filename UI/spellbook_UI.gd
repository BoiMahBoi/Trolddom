extends Control

@onready var equipment_page = %EquipmentPage

var spell_pages = []
var all_pages = []

# Called when the node enters the scene tree for the first time.
func _ready():
	update_page_arrays()

func next_page():
	pass
	
func previous_page():
	pass

func update_page_arrays():
	spell_pages = %SpellPages.get_children()
	all_pages.append(equipment_page)
	all_pages += spell_pages

func generate_page():
	pass

func get_owned_spells():
	pass

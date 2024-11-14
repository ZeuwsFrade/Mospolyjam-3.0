extends Node

var turn_limit = 3
var building_materials = 20
var global_tiles: Array[Array]
var first_level = true
var La_finale = false
var amount_of_farms = 1
var amount_of_factories = 1
var amount_of_houses = 2
var amount_of_electro = 1
var amount_of_labs = 0
var amount_of_workshops = 0
var amount_of_engines = 2
var amount_of_rarefacrories = 0
var platformer_level_done = false
var lab_bonus = false
var upgrade_points = 0
var people = 50
var workers = 0
var food = 10
var jump_upgrade = 0
var double_jump = 5
var rare_mat = 0
var mat = 10
var energy = 50
var double_jump_ability = false
var base_deck = ["Farm","Factory","Electro","House","Engine","Workshop","Lab","Rare_factory"]
var global_deck = []
var event_num = 0
var tormozhenie = 0
var electro_pen = 0
var human_boost = 0
var durability = 100
var cycle = 0
var ne_stroim = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	build_a_deck()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func build_a_deck():
	for card in base_deck:
		match card:
			"Farm":
				for i in range(4):
					global_deck.append(card)
			"Factory":
				for i in range(4):
					global_deck.append(card)
			"Electro":
				for i in range(5):
					global_deck.append(card)
			"Workshop":
				for i in range(1):
					global_deck.append(card)
			"House":
				for i in range(4):
					global_deck.append(card)
			"Lab":
				global_deck.append(card)
			"Engine":
				for i in range(3):
					global_deck.append(card)
			"Rare_factory":
				global_deck.append(card)

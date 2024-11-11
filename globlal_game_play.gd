extends Node

var turn_limit = 5
var building_materials = 20
var global_tiles: Array[Array]
var shesterni = 0
var amount_of_farms = 2
var amount_of_factories = 1
var amount_of_houses = 2
var amount_of_electro = 1
var amount_of_labs = 0
var amount_of_workshops = 1
var amount_of_engines = 0
var amount_of_rarefacrories = 0
var lab_bonus = false
var rare_mat = 0
var base_deck = ["Farm","Factory","Electro","House","Engine","Workshop","Lab","Rare_factory"]
var global_deck = []
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

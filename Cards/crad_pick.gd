extends Control

var amount_of_selection = 1
var selected = 0
@onready var card_1 = $Panel/Card_1
@onready var card_2 = $Panel/Card_2
@onready var card_3 = $Panel/Card_3
var pick_confirmed = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GloblalGamePlay.lab_bonus == true:
		amount_of_selection += 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_card_1_pressed() -> void:
	if card_1.pick.visible == false and selected < amount_of_selection:
		card_1.pick.visible = true
		card_1.choosed = true
		selected += 1
	elif card_1.pick.visible == true and card_1.choosed == true:
		card_1.pick.visible = false
		card_1.choosed = false
		selected -= 1

func _on_card_2_pressed() -> void:
	if card_2.pick.visible == false and selected < amount_of_selection:
		card_2.pick.visible = true
		card_2.choosed = true
		selected += 1
	elif card_2.pick.visible == true and card_2.choosed == true:
		card_2.pick.visible = false
		card_2.choosed = false
		selected -= 1

func _on_card_3_pressed() -> void:
	if card_3.pick.visible == false and selected < amount_of_selection:
		card_3.pick.visible = true
		card_3.choosed = true
		selected += 1
	elif card_3.pick.visible == true and card_3.choosed == true:
		card_3.pick.visible = false
		card_3.choosed = false
		selected -= 1


func _on_confirm_pressed() -> void:
	if selected == amount_of_selection:
		if card_1.choosed == true:
			pick_confirmed.append(card_1.type)
		else:
			GloblalGamePlay.global_deck.append(card_1.type)
		if card_2.choosed == true:
			pick_confirmed.append(card_2.type)
		else:
			GloblalGamePlay.global_deck.append(card_2.type)
		if card_3.choosed == true:
			pick_confirmed.append(card_3.type)
		else:
			GloblalGamePlay.global_deck.append(card_3.type)
		for i in pick_confirmed:
			match i:
				"Farm":
					GloblalGamePlay.amount_of_farms += 1
				"Factory":
					GloblalGamePlay.amount_of_factories += 1
				"Electro":
					GloblalGamePlay.amount_of_electro += 1
				"Workshop":
					GloblalGamePlay.amount_of_workshops += 1
				"Lab":
					GloblalGamePlay.amount_of_labs += 1
				"House":
					GloblalGamePlay.amount_of_houses += 1
				"Engine":
					GloblalGamePlay.amount_of_engines += 1
				"Rare_factory":
					GloblalGamePlay.amount_of_rarefacrories += 1
		selected = 0
		card_1.pick.visible = false
		card_1.choosed = false
		card_2.pick.visible = false
		card_2.choosed = false
		card_3.pick.visible = false
		card_3.choosed = false
		pick_confirmed = []
		visible = false

func new_pick(card1, card2, card3):
	if GloblalGamePlay.global_deck.size() > 3:
		print(GloblalGamePlay.global_deck)
		print(GloblalGamePlay.global_deck.size())
		var card_ind = randi_range(0,GloblalGamePlay.global_deck.size()-1)
		card1.type = GloblalGamePlay.global_deck[card_ind]
		GloblalGamePlay.global_deck.remove_at(card_ind)
		card_ind = randi_range(0,GloblalGamePlay.global_deck.size()-1)
		card2.type = GloblalGamePlay.global_deck[card_ind]
		GloblalGamePlay.global_deck.remove_at(card_ind)
		card_ind = randi_range(0,GloblalGamePlay.global_deck.size()-1)
		card3.type = GloblalGamePlay.global_deck[card_ind]
		GloblalGamePlay.global_deck.remove_at(card_ind)
	else:
		return 0

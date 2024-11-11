extends Node2D

var card_preset = load("res://Cards/card.tscn")

var Hand_place = [$Card1, $Card2, $Card3, $Card4, $Card5, $Card6]
var Hand_ID = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_hand()

func set_hand():
	var dragged
	for i in range(5):
		dragged = card_preset.instantiate()
		add_child(dragged)
		dragged.card_data_set()
		dragged.rotation_degrees = Hand_place[i].rotation_degrees
		dragged.position = Hand_place[i].marker.position
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

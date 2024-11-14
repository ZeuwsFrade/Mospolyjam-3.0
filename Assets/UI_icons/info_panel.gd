extends Control

var type = ""
@onready var info = $Panel/Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#if type == "Farm":
		#info.text = "Это пищеблок. Стомость: 5 материалов, Производство: 5 пищи, Потребление: 5 энергии"

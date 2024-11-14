extends TextureButton

@export var type = ""
@onready var base = $"../../../../.."
@onready var selected_build = $"../../../../Selected_building"
@onready var amount = $Label
@onready var info = $"../../../../Info_panel"
var info_in = false
@export var amount_of_cards = 0

var selected = false

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if type == "Farm":
		amount_of_cards = GloblalGamePlay.amount_of_farms
	elif type == "Factory":
		amount_of_cards = GloblalGamePlay.amount_of_factories
	elif type == "House":
		amount_of_cards = GloblalGamePlay.amount_of_houses
	elif type == "Electro":
		amount_of_cards = GloblalGamePlay.amount_of_electro
	if type == "Workshop":
		amount_of_cards = GloblalGamePlay.amount_of_workshops
	elif type == "Lab":
		amount_of_cards = GloblalGamePlay.amount_of_labs
	elif type == "Engine":
		amount_of_cards = GloblalGamePlay.amount_of_engines
	elif type == "Rare_factory":
		amount_of_cards = GloblalGamePlay.amount_of_rarefacrories
	amount.text = str(amount_of_cards)
	if info_in == true:
		info.position.x = get_global_mouse_position().x + 5
		info.position.y = get_global_mouse_position().y + 5

func _on_pressed() -> void:
	if selected_build.visible != true:
		selected_build.position.x = self.global_position.x + 43
		selected_build.position.y = self.global_position.y + 43
		selected_build.texture.size = self.custom_minimum_size
		selected_build.visible = true
		base.building_type = type
	else:
		selected_build.visible = false
		base.building_type= ""

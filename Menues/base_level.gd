extends Node2D

@onready var dialog = $UI/Dialog
@onready var tilemap = $TileMapLayer
@onready var selected_tile = $Selected_tile
@onready var pop_up = $Option_selection
@onready var card_info = $UI/Card
var building_type = ""
var tile_coord
var tile_type
var pop_up_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pop_up.add_item("Улучшить", 1)
	pop_up.add_item("Снести", 2)
	pop_up.add_item("Информация", 3)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func get_clicked_tile_power():
	var clicked_cell = tilemap.local_to_map(tilemap.get_local_mouse_position())
	var data = tilemap.get_cell_tile_data(clicked_cell)
	if data:
		return data.get_custom_data("Type_of_tile")
	else:
		return 0

func get_clicked_tile_coords():
	var clicked_cell = tilemap.local_to_map(tilemap.get_local_mouse_position())
	var tilecord = tilemap.map_to_local(clicked_cell)
	return tilecord

func _input(event):
	if event.is_action_pressed("LMB"):
		if typeof(get_clicked_tile_power()) != 2:
			tile_coord = get_clicked_tile_coords()
			selected_tile.visible = true
			selected_tile.position.x = tile_coord.x
			selected_tile.position.y = tile_coord.y
		elif typeof(get_clicked_tile_power()) == 2:
			selected_tile.visible = false
			tile_coord = null
			selected_tile.position.x = 0
			selected_tile.position.y = 0
	if event.is_action_pressed("RMB"):
		if building_type != "" and selected_tile.visible != false and tilemap.local_to_map(selected_tile.position) == tilemap.local_to_map(tilemap.get_local_mouse_position()) and GloblalGamePlay.turn_limit != 0:
			if building_type == "Farm" and GloblalGamePlay.amount_of_farms != 0:
				tile_type = get_clicked_tile_power()
				tile_coord = get_clicked_tile_coords()
				if tile_type == "Nothing":
					tilemap.set_cell(tilemap.local_to_map(tile_coord), 0,Vector2i(1, 0))
					GloblalGamePlay.amount_of_farms -= 1
				else:
					return 0
			elif building_type == "Factory" and GloblalGamePlay.amount_of_factories != 0:
				tile_type = get_clicked_tile_power()
				tile_coord = get_clicked_tile_coords()
				if tile_type == "Nothing":
					tilemap.set_cell(tilemap.local_to_map(tile_coord), 0,Vector2i(3, 0))
					GloblalGamePlay.amount_of_factories -= 1
				else:
					return 0
			elif building_type == "House" and GloblalGamePlay.amount_of_houses != 0:
				tile_type = get_clicked_tile_power()
				tile_coord = get_clicked_tile_coords()
				if tile_type == "Nothing":
					tilemap.set_cell(tilemap.local_to_map(tile_coord), 0,Vector2i(2, 0))
					GloblalGamePlay.amount_of_houses -= 1
				else:
					return 0
			elif building_type == "Electro" and GloblalGamePlay.amount_of_electro != 0:
				tile_type = get_clicked_tile_power()
				tile_coord = get_clicked_tile_coords()
				if tile_type == "Nothing":
					tilemap.set_cell(tilemap.local_to_map(tile_coord), 0,Vector2i(7, 0))
					GloblalGamePlay.amount_of_electro -= 1
				else :
					return 0
			elif building_type == "Workshop" and GloblalGamePlay.amount_of_workshops != 0:
				tile_type = get_clicked_tile_power()
				tile_coord = get_clicked_tile_coords()
				if tile_type == "Nothing":
					tilemap.set_cell(tilemap.local_to_map(tile_coord), 0,Vector2i(4, 0))
					dialog.visible = true
					GloblalGamePlay.amount_of_workshops -= 1
				else:
					return 0
			elif building_type == "Lab" and GloblalGamePlay.amount_of_labs != 0:
				tile_type = get_clicked_tile_power()
				tile_coord = get_clicked_tile_coords()
				if tile_type == "Nothing":
					tilemap.set_cell(tilemap.local_to_map(tile_coord), 0,Vector2i(6, 0))
					GloblalGamePlay.amount_of_labs -= 1
				else:
					return 0
			elif building_type == "Engine" and GloblalGamePlay.amount_of_engines != 0:
				tile_type = get_clicked_tile_power()
				tile_coord = get_clicked_tile_coords()
				if tile_type == "Nothing":
					tilemap.set_cell(tilemap.local_to_map(tile_coord), 0,Vector2i(5, 0))
					GloblalGamePlay.amount_of_engines -= 1
				else:
					return 0
			elif building_type == "Rare_factory" and GloblalGamePlay.amount_of_rarefacrories != 0:
				tile_type = get_clicked_tile_power()
				tile_coord = get_clicked_tile_coords()
				if tile_type == "Nothing":
					tilemap.set_cell(tilemap.local_to_map(tile_coord), 0,Vector2i(0, 1))
					GloblalGamePlay.amount_of_rarefacrories -= 1
				else:
					return 0
			building_type = ""
			tilemap.tiles_on_changed()
			tilemap.turn()
		elif building_type == "" and selected_tile.visible != false and tilemap.local_to_map(selected_tile.position) == tilemap.local_to_map(tilemap.get_local_mouse_position()):
			pop_up_pos = tilemap.map_to_local(tilemap.local_to_map(tilemap.get_local_mouse_position()))
			pop_up.position = get_global_mouse_position()
			pop_up.visible = true

func _on_option_selection_id_pressed(id: int) -> void:
	if id == 2 and GloblalGamePlay.turn_limit != 0:
		if tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "Farm" or "Farm_up":
			GloblalGamePlay.amount_of_farms += 1
		elif tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "Factory":
			GloblalGamePlay.amount_of_factories += 1
		elif tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "House":
			GloblalGamePlay.amount_of_houses += 1
		elif tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "Lab":
			GloblalGamePlay.amount_of_labs += 1
		elif tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "Workshop":
			GloblalGamePlay.amount_of_workshops += 1
		elif tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "Rare_factory":
			GloblalGamePlay.amount_of_rarefacrories += 1
		elif tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "Electro":
			GloblalGamePlay.amount_of_electro += 1
		elif tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "Engine":
			GloblalGamePlay.amount_of_engines += 1
		tilemap.set_cell(tilemap.local_to_map(pop_up_pos), 0,Vector2i(0, 0))
		tilemap.tiles_on_changed()
		tilemap.turn()
	if id == 1 and GloblalGamePlay.turn_limit != 0:
		if tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "Farm":
			tilemap.set_cell(tilemap.local_to_map(pop_up_pos), 0, Vector2i(1,1))
		tilemap.tiles_on_changed()
		tilemap.turn()
	if id == 3:
		if tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "Farm":
			card_info.type = "Farm"
			card_info.visible = true
		elif tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "Factory":
			card_info.type = "Factory"
			card_info.visible = true
		elif tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "House":
			card_info.type = "House"
			card_info.visible = true
		elif tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "Lab":
			card_info.type = "Lab"
			card_info.visible = true
		elif tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "Workshop":
			card_info.type = "Workshop"
			card_info.visible = true
		elif tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "Rare_factory":
			card_info.type = "Rare_factory"
			card_info.visible = true
		elif tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "Electro":
			card_info.type = "Electro"
			card_info.visible = true
		elif tilemap.get_tile_type(tilemap.local_to_map(pop_up_pos)) == "Engine":
			card_info.type = "Engine"
			card_info.visible = true


func _on_button_pressed() -> void:
	$UI/Crad_pick.new_pick($UI/Crad_pick.card_1,$UI/Crad_pick.card_2,$UI/Crad_pick.card_3)
	$UI/Crad_pick.visible = true

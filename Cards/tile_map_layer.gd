extends TileMapLayer

var tilemap_size = get_used_rect().end - get_used_rect().position
var tilemap_tiles: Array[Array]
@onready var food_l = $"../UI/Food"
@onready var mech_l = $"../UI/Mech"
@onready var energy_l = $"../UI/Energy"
@onready var turns = $"../UI/Truns"

var food = 0
var mech = 0
var energy = 0
var people = 50
var electro_produce = 0
var farm_produce = 0
var factory_produce = 0
var overall_spent = 0
var up_points = 0
var up_points_produce = 0
var energy_consume = 0
var mat_consume = 0
var rare_production = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_all_tiles()
	tiles_on_changed()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	food_l.text = str(food)
	mech_l.text = str(mech)
	energy_l.text = str(energy)
	turns.text = "Осталось действий: " + str(GloblalGamePlay.turn_limit)
	pass


func tiles_on_changed():
	people = 50
	up_points_produce = 0
	farm_produce = 0
	electro_produce = 0
	factory_produce = 0
	energy_consume = 0
	mat_consume = 0
	for i in tilemap_size.x:
		for j in tilemap_size.y:
			var coords = Vector2(i, j)
			var tile_data = get_tile_type(coords)
			if tile_data == "Factory":
				factory_produce += 3
				energy_consume += 3
				people -= 5
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Factory" or "Factory_up":
						factory_produce += 3*0.5
			elif tile_data == "Factory_up":
				factory_produce += 3
				energy_consume += 1.5
				people -= 5
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Factory" or "Factory_up":
						factory_produce += 3*0.5
			elif tile_data == "Farm":
				farm_produce += 3
				energy_consume += 2
				people -= 5
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Factory" or "Factory_up":
						farm_produce -= 3*0.5
					elif tile_nei == "Farm" or "Farm_up":
						farm_produce += 3*0.5
			elif tile_data == "Farm_up":
				farm_produce += 3
				energy_consume += 1
				people -= 5
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Factory" or "Factory_up":
						farm_produce -= 3*0.5
					elif tile_nei == "Farm" or "Farm_up":
						farm_produce += 3*0.5
			elif tile_data == "House":
				people += 5
				energy_consume += 2
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "House" or "House_up":
						people += 3
			elif tile_data == "House_up":
				people += 5
				energy_consume += 1
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "House" or "House_up":
						people += 3
			elif tile_data == "Electro":
				electro_produce += 3
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Electro" or "Electro_up":
						electro_produce += 3
			elif tile_data == "Electro":
				electro_produce += 3
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Electro" or "Electro_up":
						electro_produce += 3
			elif tile_data == "Electro_up":
				electro_produce += 5
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Electro" or "Electro_up":
						electro_produce += 3
					elif tile_nei == "Electro_up":
						electro_produce += 5
			elif tile_data == "Lab":
				GloblalGamePlay.lab_bonus = true 
				energy_consume += 5
				mat_consume += 2
				people -= 5
			elif tile_data == "Lab_up":
				GloblalGamePlay.lab_bonus = true
				energy_consume += 3
				mat_consume += 1
				people -= 5
			elif tile_data == "Engine":
				energy_consume += 5
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Engine" or "Engine_up":
						electro_produce += 3
			elif tile_data == "Engine_up":
				energy_consume += 3
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Engine" or "Engine_up":
						energy_consume += 3
			elif tile_data == "Workshop":
				up_points_produce += 1
				energy_consume += 4
				mat_consume += 1
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Factory" or "Factory_up":
						factory_produce += 1
			elif tile_data == "Workshop_up":
				up_points_produce += 1
				energy_consume += 2
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Factory" or "Factory_up":
						factory_produce += 1
			elif tile_data == "Rare_factory":
				rare_production += 0.2
				energy_consume += 8
				mat_consume += 2

	collect_all_tiles()

func collect_all_tiles():
	var one_tile = []
	for i in tilemap_size.x:
		for j in tilemap_size.y:
			var coords = Vector2(i, j)
			one_tile.append(coords)
			var tile_data = get_cell_atlas_coords(coords)
			one_tile.append(tile_data)
			tilemap_tiles.append(one_tile)
			one_tile = []
			GloblalGamePlay.global_tiles = tilemap_tiles
	return  tilemap_tiles

func set_all_tiles():
	if GloblalGamePlay.global_tiles != null:
		for i in GloblalGamePlay.global_tiles:
			set_cell(i[0], 0, i[1])
	else :
		pass

func get_all_neighbours(tile_coords):
	var neighbour_tiles = []
	neighbour_tiles.append(get_tile_type(get_neighbor_cell(tile_coords,TileSet.CELL_NEIGHBOR_LEFT_SIDE)))
	neighbour_tiles.append(get_tile_type(get_neighbor_cell(tile_coords,TileSet.CELL_NEIGHBOR_BOTTOM_SIDE)))
	neighbour_tiles.append(get_tile_type(get_neighbor_cell(tile_coords,TileSet.CELL_NEIGHBOR_TOP_SIDE)))
	neighbour_tiles.append(get_tile_type(get_neighbor_cell(tile_coords,TileSet.CELL_NEIGHBOR_RIGHT_SIDE)))
	for i in neighbour_tiles:
		if typeof(i) == 2:
			neighbour_tiles.erase(i)
	return neighbour_tiles

func get_tile_type(tile_coords):
	var data = get_cell_tile_data(tile_coords)
	if data:
		return data.get_custom_data("Type_of_tile")
	else:
		return 0

func turn():
	GloblalGamePlay.turn_limit -= 1
	food += farm_produce - ((people / 10))
	mech += factory_produce - mat_consume
	energy += electro_produce - energy_consume
	GloblalGamePlay.rare_mat += rare_production
	pass

extends TileMapLayer

var tilemap_size = get_used_rect().end - get_used_rect().position
var tilemap_tiles: Array[Array]
@onready var food_l = $"../UI/Food_icon/Food"
@onready var mech_l = $"../UI/Mech_icon/Mech"
@onready var energy_l = $"../UI/Energy"
@onready var turns = $"../UI/Truns"

var workers = 0
var houses = 0
var electro_produce = 0
var farm_produce = 0
var factory_produce = 0
var overall_spent = 0
var up_points_produce = 0
var energy_consume = 0
var mat_consume = 0
var rare_production = 0
var tormozhenie_produce = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_all_tiles()
	tiles_on_changed()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	food_l.text = str(GloblalGamePlay.food)
	mech_l.text = str(GloblalGamePlay.mat)
	$"../UI/Dur".text = "Прочность корпуса: " + str(GloblalGamePlay.durability)
	$"../UI/Stab".text = "Стабилизация: " + str(GloblalGamePlay.tormozhenie) + "%"
	energy_l.text = "Энергия: " + str(GloblalGamePlay.energy)
	$"../UI/People".text = "Население: " + str(workers) + "/" + str(GloblalGamePlay.people)
	turns.text = "Осталось действий: " + str(GloblalGamePlay.turn_limit)
	if GloblalGamePlay.electro_pen == 2:
		GloblalGamePlay.energy -= 25
		GloblalGamePlay.electro_pen = 0


func tiles_on_changed():
	workers = 0
	up_points_produce = 0
	farm_produce = 0
	electro_produce = 0
	factory_produce = 0
	energy_consume = 0
	mat_consume = 0
	tormozhenie_produce = 0
	for i in tilemap_size.x:
		for j in tilemap_size.y:
			var coords = Vector2(i, j)
			var tile_data = get_tile_type(coords)
			if tile_data == "Factory":
				factory_produce += 3
				energy_consume += 3
				workers += 5
				mat_consume += 1
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Factory" or tile_nei == "Factory_up":
						factory_produce += 3*0.5
			elif tile_data == "Factory_up":
				factory_produce += 3
				energy_consume += 1.5
				workers += 5
				mat_consume += 1
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Factory" or tile_nei == "Factory_up":
						factory_produce += 3*0.5
			elif tile_data == "Farm":
				farm_produce += 3
				energy_consume += 2
				workers += 5
				mat_consume += 1
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Factory" or tile_nei == "Factory_up":
						farm_produce -= 3*0.5
					elif tile_nei == "Farm" or tile_nei == "Farm_up":
						farm_produce += 3*0.5
			elif tile_data == "Farm_up":
				farm_produce += 3
				energy_consume += 1
				workers += 5
				mat_consume += 1
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Factory" or tile_nei == "Factory_up":
						farm_produce -= 3*0.5
					elif tile_nei == "Farm" or tile_nei == "Farm_up":
						farm_produce += 3*0.5
			elif tile_data == "House":
				houses += 1
				energy_consume += 2
				mat_consume += 1
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "House" or tile_nei == "House_up":
						houses += 0.5
			elif tile_data == "House_up":
				houses += 1
				energy_consume += 1
				mat_consume += 1
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "House" or tile_nei == "House_up":
						houses += 0.5
			elif tile_data == "Electro":
				electro_produce += 3
				mat_consume += 1
				workers += 5
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Electro" or tile_nei == "Electro_up":
						if GloblalGamePlay.electro_pen == 1:
							electro_produce += 1.5
						else:
							electro_produce += 3
			elif tile_data == "Electro_up":
				electro_produce += 5
				mat_consume += 1
				workers += 5
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Electro" or tile_nei == "Electro_up":
						if GloblalGamePlay.electro_pen == 1:
							electro_produce += 1.5
					elif tile_nei == "Electro_up":
						if GloblalGamePlay.electro_pen == 1:
							electro_produce += 2.5
			elif tile_data == "Lab":
				GloblalGamePlay.lab_bonus = true 
				energy_consume += 5
				mat_consume += 2
				workers += 5
			elif tile_data == "Lab_up":
				GloblalGamePlay.lab_bonus = true
				energy_consume += 3
				mat_consume += 1
				workers += 5
			elif tile_data == "Engine":
				tormozhenie_produce += 0.5
				energy_consume += 5
				mat_consume += 1
				workers += 5
			elif tile_data == "Engine_up":
				tormozhenie_produce += 0.5
				energy_consume += 3
				mat_consume += 1
				workers += 5
			elif tile_data == "Workshop":
				up_points_produce += 1
				energy_consume += 4
				mat_consume += 1
				workers += 5
				GloblalGamePlay.double_jump_ability = true
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Factory" or tile_nei == "Factory_up":
						factory_produce += 1
			elif tile_data == "Workshop_up":
				up_points_produce += 1
				energy_consume += 2
				workers += 5
				GloblalGamePlay.double_jump_ability = true
				for tile_nei in get_all_neighbours(coords):
					if tile_nei == "Factory" or tile_nei == "Factory_up":
						factory_produce += 1
			elif tile_data == "Rare_factory":
				workers += 5
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
	GloblalGamePlay.food += farm_produce - ((GloblalGamePlay.people / 10))
	GloblalGamePlay.mat += factory_produce - mat_consume
	GloblalGamePlay.energy += electro_produce - energy_consume
	GloblalGamePlay.people += GloblalGamePlay.human_boost
	GloblalGamePlay.upgrade_points += up_points_produce
	GloblalGamePlay.rare_mat += rare_production
	GloblalGamePlay.tormozhenie += tormozhenie_produce
	if factory_produce < 0:
		GloblalGamePlay.durability -= 1
	if GloblalGamePlay.mat < 0:
		GloblalGamePlay.durability -= 1
	if GloblalGamePlay.food < 0:
		GloblalGamePlay.people -= 5
	if GloblalGamePlay.energy < 0:
		GloblalGamePlay.tormozhenie -= 1
	pass

extends Control
@onready var progress_bar = $ProgressBar
@onready var con_butt = $Continue
var scene_load = "res://Platformer_part/Levels/level_1.tscn"
var progress = []
var loading_status = 0

func _ready():
	if GloblalGamePlay.platformer_level_done == true:
		scene_load = "res://Menues/Base_level.tscn"
	elif  GloblalGamePlay.La_finale == true:
		scene_load = "res://Menues/la_finale.tscn"
	elif GloblalGamePlay.cycle == 0:
		scene_load = "res://Platformer_part/Levels/level_1.tscn"
		$Label.visible = true
	elif GloblalGamePlay.cycle == 1:
		scene_load = "res://Platformer_part/Levels/level_2.tscn"
	elif GloblalGamePlay.cycle == 2:
		scene_load = "res://Platformer_part/Levels/level_3.tscn"
	elif GloblalGamePlay.cycle == 3:
		scene_load = "res://Platformer_part/Levels/level_4.tscn"
	elif GloblalGamePlay.cycle == 4:
		scene_load = "res://Platformer_part/Levels/level_5.tscn"
	elif GloblalGamePlay.cycle == 5:
		scene_load = "res://Platformer_part/Levels/level_6.tscn"
	ResourceLoader.load_threaded_request(scene_load)

func _process(_delta):
	loading_status = ResourceLoader.load_threaded_get_status(scene_load,progress)
	progress_bar.value = progress[0] * 100
	if loading_status == ResourceLoader.THREAD_LOAD_LOADED:
		con_butt.visible = true
		

func _on_continue_pressed() -> void:
	if loading_status == ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_file(scene_load)
	else:
		pass

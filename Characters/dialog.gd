extends Control

var dialogue: Array[Array]
@onready var speech = $Dialog_ui/Text/RichTextLabel
@onready var speaker = $Dialog_ui/Text/Speakingchar
@onready var hero = $Dialog_ui/Hero
@onready var NPC = $Dialog_ui/NPC

var current_line = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_line < dialogue.size():
		speaker.text = dialogue[current_line][0]
		speech.text = dialogue[current_line][1]
	else:
		speech.text = "Конец диалога"
	if current_line > dialogue.size():
		if GlobalDialog.dialog_num == 1:
			GlobalDialog.dialog_num += 1
			visible = false
			GloblalGamePlay.cycle += 1
			get_tree().change_scene_to_file("res://Menues/loading_screen.tscn")
		elif GlobalDialog.dialog_num == 2:
			visible = false
			$"../Event".visible = true
		elif GlobalDialog.dialog_num == 3:
			visible = false
			$"../Event".visible = true
		elif GlobalDialog.dialog_num == 4:
			visible = false
			GloblalGamePlay.cycle += 1
			get_tree().change_scene_to_file("res://Menues/loading_screen.tscn")
	if speaker.text == "Марта": 
		$Dialog_ui/NPC.texture = load("res://Characters/Marta.png")
	elif speaker.text != "Марта" and speaker.text != "Колетт":
		$Dialog_ui/NPC.texture = load("res://Characters/Siluet.png")
		pass
		
func _on_button_pressed() -> void:
	current_line += 1

func new_dialog():
	match GlobalDialog.dialog_num:
		1:
			current_line = 0
			GlobalDialog.new_global_dialog()
			dialogue = GlobalDialog.read_from_dialog(GlobalDialog.dialog_1)
			speaker.text = dialogue[current_line][0]
			speech.text = dialogue[current_line][1]
		2:
			current_line = 0
			GlobalDialog.new_global_dialog()
			dialogue = GlobalDialog.read_from_dialog(GlobalDialog.dialog_1)
			speaker.text = dialogue[current_line][0]
			speech.text = dialogue[current_line][1]
		3:
			current_line = 0
			GlobalDialog.new_global_dialog()
			dialogue = GlobalDialog.read_from_dialog(GlobalDialog.dialog_1)
			speaker.text = dialogue[current_line][0]
			speech.text = dialogue[current_line][1]
			print(dialogue)
		4:
			current_line = 0
			GlobalDialog.new_global_dialog()
			dialogue = GlobalDialog.read_from_dialog(GlobalDialog.dialog_1)
			speaker.text = dialogue[current_line][0]
			speech.text = dialogue[current_line][1]

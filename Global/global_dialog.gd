extends Node

var dialog_1
var dialog_num = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match dialog_num:
		1:
			dialog_1 = read_from_JSON("res://Dialogs/Dialog_1.json")
		2:
			dialog_1 = read_from_JSON("res://Dialogs/Dialog_2.json")
		3:
			dialog_1 = read_from_JSON("res://Dialogs/Dialog_3.json")
		4:
			dialog_1 = read_from_JSON("res://Dialogs/Dialog_4.json")

func read_from_JSON(path: StringName):
	var file
	var data
	if (FileAccess.file_exists(path)):
		file = FileAccess.open(path, FileAccess.READ)
		data = JSON.parse_string(file.get_as_text())
		file.close()
		return data
	else:
		printerr("File doesn't exist")
		
func read_from_dialog(dialog: Dictionary):
	var str_of_dialog: Array
	var str_fo_dialog_extra: Array
	var dialog_full: Array[Array]
	for stri in range(1, dialog.size()+1):
		str_of_dialog.append(dialog.get(str(stri)).name)
		str_of_dialog.append(dialog.get(str(stri)).speech)
		str_fo_dialog_extra = str_of_dialog.duplicate()
		dialog_full.append(str_fo_dialog_extra)
		str_of_dialog.clear()
	return dialog_full

func new_global_dialog():
		match dialog_num:
			1:
				dialog_1 = read_from_JSON("res://Dialogs/Dialog_1.json")
			2:
				dialog_1 = read_from_JSON("res://Dialogs/Dialog_2.json")
			3:
				dialog_1 = read_from_JSON("res://Dialogs/Dialog_3.json")
			4:
				dialog_1 = read_from_JSON("res://Dialogs/Dialog_4.json")
	

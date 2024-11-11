extends Control

var dialogue = [["Коллет", "Марта, что происходит? Почему сработал протокол “Ковчег”?"], ["Марта", "А вот и ты... Я боялась, что ты не успеешь…"],
["Марта", "Дорогуша, не нервничай. у нас всего лишь произошла маленькая перегрузка главного генератора, типичный сценарий ЧП класса Йота, но на йоту более масштабный."]

]
@onready var speech = $Dialog_ui/Text/RichTextLabel
@onready var speaker = $Dialog_ui/Text/Speakingchar
@onready var hero = $Dialog_ui/Hero
@onready var NPC = $Dialog_ui/NPC

var current_line = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speaker.text = dialogue[current_line][0]
	speech.text = dialogue[current_line][1]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_line < dialogue.size():
		speaker.text = dialogue[current_line][0]
		speech.text = dialogue[current_line][1]
	else:
		speech.text = "Thank you for chatting!"
	if current_line > dialogue.size():
		visible = false
	if speaker.text == "Коллет": 
		#hero
		pass
	else:
		#NPC
		pass


func _on_button_pressed() -> void:
	current_line += 1

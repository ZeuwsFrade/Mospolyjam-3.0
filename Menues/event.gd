extends Control

@onready var variant_1 = $TextureRect/VBoxContainer/Var_1
@onready var variant_2 = $TextureRect/VBoxContainer/Var_2
@onready var variant_3 = $TextureRect/VBoxContainer/Var_3
@onready var variant_4 = $TextureRect/VBoxContainer/Var_4
@onready var variant_5 = $TextureRect/VBoxContainer/Var_5
@onready var event_text = $TextureRect/Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match GloblalGamePlay.event_num:
		0:
			event_text.text = "Представ пред очередной поломкой главного двигателя, Ковчег:"
			variant_1.text = "Смог найти редкие компоненты в срок (+10% торможения)(-1 редкая деталь)"
			variant_2.text = "Довольствовался тем, что имеет."
		1:
			event_text.text = "Ковчег справился с перегрузкой энергосистем:"
			variant_1.text = "Снизил нагрузку в ущерб производительности (-50% бонуса соседства для генераторов) "
			variant_2.text = "Произвел перезагрузку (- 25 энергии)."
			variant_3.text = "Использовал редкие компоненты для улучшения пропускной способности (-1 редкая деталь)"
			variant_3.visible = true
		2:
			event_text.text = "Когда лидерам Ковчега пришлось выбирать, чьи жизни спасать первыми, выбор пал на:"
			variant_1.text = "То, чтобы сохранить тех, кому повезло оказаться здесь. (+50% торможения)"
			variant_2.text = "То, чтобы спасти как можно больше людей (+5 населения каждый цикл)."
			variant_3.visible = false
		3:
			event_text.text = "Представ пред очередной поломкой главного двигателя, Ковчег:"
			variant_1.text = "Смог найти редкие компоненты в срок (+10% торможения)(-1 редкая деталь)"
			variant_2.text = "Довольствовался тем, что имеет."
		4:
			event_text.text = "Когда запасы внезапно оказались на нуле, Ковчег:"
			variant_1.text = "Затянул пояса и погряз в распрях (-50% производства пайков)"
			variant_2.text = "Совершил открытие, способное победить голод (Теперь пищевые блоки могут бесконечно производить пищу. -2 редких деталей)"
		5:
			event_text.text = "Представ пред очередной поломкой главного двигателя, Ковчег:"
			variant_1.text = "Смог найти редкие компоненты в срок (+10% торможения)(-1 редкая деталь)"
			variant_2.text = "Довольствовался тем, что имеет."
		6:
			event_text.text = "Под гневом народа, Ковчег пошатнулся, и:"
			variant_1.text = "Изгнал старого управляющего (+50% потребления стройматериалов для обеспечения зданий)"
			variant_2.text = "Изгнал нового управляющего (+50% потребления стройматериалов для обеспечения зданий)"
			variant_3.visible = true
			variant_3.text = "Изгнал предателей (Мы не стали разбираться. +100% потребления стройматериалов для обеспечения зданий)"
		7:
			event_text.text = "Представ пред очередной поломкой главного двигателя, Ковчег:"
			variant_1.text = "Смог найти редкие компоненты в срок (+10% торможения)(-1 редкая деталь)"
			variant_2.text = "Довольствовался тем, что имеет."
			variant_3.visible = false
		8:
			event_text.text = "Осознав, что я совершила, я:"
			variant_1.text = "Устремилась в машинное отделение."
			variant_2.visible = false
func _on_var_1_pressed() -> void:
	if (GloblalGamePlay.event_num == 0 or GloblalGamePlay.event_num == 3) and GloblalGamePlay.rare_mat > 0:
		GloblalGamePlay.event_num += 1
		GloblalGamePlay.tormozhenie += 10
		GloblalGamePlay.rare_mat -= 1
	elif GloblalGamePlay.event_num == 1:
		GloblalGamePlay.event_num += 1
		GloblalGamePlay.electro_pen = 1
	elif GloblalGamePlay.event_num == 2:
		GloblalGamePlay.event_num += 1
		GloblalGamePlay.tormozhenie += 30
		visible = false
		GloblalGamePlay.cycle += 1
		get_tree().change_scene_to_file("res://Menues/loading_screen.tscn")
	elif GloblalGamePlay.event_num == 4:
		GloblalGamePlay.event_num += 1
		GloblalGamePlay.food -= 50
		GloblalGamePlay.cycle += 1
		get_tree().change_scene_to_file("res://Menues/loading_screen.tscn")
	elif GloblalGamePlay.event_num == 5 and GloblalGamePlay.rare_mat > 0:
		GloblalGamePlay.event_num += 1
		GloblalGamePlay.tormozhenie += 10
		GloblalGamePlay.rare_mat -= 1
		GlobalDialog.dialog_num += 1
		visible = false
		$"../Dialog".new_dialog()
		$"../Dialog".visible = true
	elif GloblalGamePlay.event_num == 6:
		GloblalGamePlay.event_num += 1
		GloblalGamePlay.cycle += 1
		GloblalGamePlay.mat -= 100
		get_tree().change_scene_to_file("res://Menues/loading_screen.tscn")
	elif GloblalGamePlay.event_num == 7:
		GloblalGamePlay.event_num += 1
		GloblalGamePlay.tormozhenie += 10
		GloblalGamePlay.rare_mat -= 1
		pass
	elif GloblalGamePlay.event_num == 8:
		GloblalGamePlay.event_num += 1
		GlobalDialog.dialog_num += 1
		visible = false
		$"../Dialog".new_dialog()
		$"../Dialog".visible = true
		
func _on_var_2_pressed() -> void:
	if (GloblalGamePlay.event_num == 0 or GloblalGamePlay.event_num == 3):
		GloblalGamePlay.event_num += 1
	elif GloblalGamePlay.event_num == 1:
		GloblalGamePlay.event_num += 1
		GloblalGamePlay.electro_pen = 2
	elif GloblalGamePlay.event_num == 2:
		GloblalGamePlay.event_num += 1
		GloblalGamePlay.human_boost += 5
		visible = false
		GloblalGamePlay.cycle += 1
		get_tree().change_scene_to_file("res://Menues/loading_screen.tscn")
	elif GloblalGamePlay.event_num == 4 and GloblalGamePlay.rare_mat >= 2:
		GloblalGamePlay.event_num += 1
		GloblalGamePlay.rare_mat -= 2
		GloblalGamePlay.food += 100 
		GloblalGamePlay.cycle += 1
		get_tree().change_scene_to_file("res://Menues/loading_screen.tscn")
	elif GloblalGamePlay.event_num == 5:
		GloblalGamePlay.event_num += 1
		GlobalDialog.dialog_num += 1
		visible = false
		print(GlobalDialog.dialog_num)
		$"../Dialog".new_dialog()
		$"../Dialog".visible = true
	elif GloblalGamePlay.event_num == 6:
		GloblalGamePlay.mat -= 50
		GloblalGamePlay.event_num += 1
		GloblalGamePlay.cycle += 1
		get_tree().change_scene_to_file("res://Menues/loading_screen.tscn")

func _on_var_3_pressed() -> void:
	if GloblalGamePlay.event_num == 1 and GloblalGamePlay.rare_mat > 0:
		GloblalGamePlay.event_num += 1
		GloblalGamePlay.rare_mat -= 1
	elif GloblalGamePlay.event_num == 6:
		GloblalGamePlay.mat -= 100
		GloblalGamePlay.event_num += 1
		GloblalGamePlay.cycle += 1
		get_tree().change_scene_to_file("res://Menues/loading_screen.tscn")


func _on_var_4_pressed() -> void:
	pass # Replace with function body.


func _on_var_5_pressed() -> void:
	pass # Replace with function body.

extends Control

@onready var Name = $TextureRect/Name
@onready var Icon = $TextureRect/Icon
@onready var Description = $TextureRect/Description
@export var type = ""


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if type == "Farm":
		Name.text = "Пищеблок"
		Icon.texture = load("res://Assets/Icons/farm_icon.png")
		Description.text = "Это пищеблок. Здесь происходит 
		расконсервация черезвычайных запасов и их последующая обработка в 3 пищи.
		 Требует 2 энергии для своей работы."
	elif type == "Factory":
		Name.text = "Фабрика"
		Icon.texture = load("res://Assets/Icons/factory.png")
		Description.text = "Это завод. 
		Здесь происходит синтез металлов и последующая выплавка 3 конструкционных профилей. 
		Процесс требует 3 энергии."
	elif type == "Electro":
		Name.text = "Энергостанция"
		Icon.texture = load("res://Assets/Icons/electro.png")
		Description.text = "Это энергостанция. 
		Она производит 3 энергии, но её эффективность быстрее растёт от дополнительных соседей. 
		Это дополнительные двигатели. Они помогают стабилизировать падение Ковчега ценой 5 энергии."
	elif type ==  "House":
		Name.text = "Жилой отсек"
		Icon.texture = load("res://Assets/Icons/home.png")
		Description.text = "Это жилой отсек. Здесь можно разместить до 5 человек. 
		Для поддержания его работы требуется 2 энергии."
	elif type ==  "Engine":
		Name.text = "Двигатели"
		Icon.texture = load("res://Assets/Icons/Engine_icon.png")
		Description.text = "Это дополнительные двигатели. 
		Они помогают стабилизировать падение Ковчега ценой 5 энергии."
	elif type ==  "Lab":
		Name.text = "Лабаратория"
		Icon.texture = load("res://Assets/Icons/nii.png")
		Description.text = "Это НИИ. Здесь учёные в срочном порядке расшифровывают чертежи. 
		Если вам хватит ресурсов спонсоровать их исследования, то вы получите дополнительную карту в конце цикла. 
		Требует 5 энергии и 2 стройматериалов для исследований."
	elif type ==  "Workshop":
		Name.text = "Мастерская"
		Icon.texture = load("res://Assets/Icons/EI.png")
		Description.text = "Это инженерный отсек. Здесь производят экстренные улучшения вашего костюма.
		Производит 1 очко улучшения, требует 4 энергии и 1 стройматериалов для исследований."
	elif type ==  "Rare_factory":
		Name.text = "Репликатор"
		Icon.texture = load("res://Assets/Icons/rareitem.png")
		Description.text = "Это экспериментальный репликатор. 
		Он производит 0.2 редких деталей, потребляя 8 энергии и 2 стройматериалов. 
		Неизвестно как он работает."

func _on_button_pressed() -> void:
	visible = !visible
	

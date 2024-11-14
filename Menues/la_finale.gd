extends Control


@onready var stats = $Stats
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	stats.text = "Стабилизация ковчега: " + str(GloblalGamePlay.tormozhenie) + "  Спасено населения: " + str(GloblalGamePlay.people) + "  Прочность корпуса: " + str(GloblalGamePlay.durability)
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Menues/main_menu.tscn")

extends Control



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		$"../UI/Pause_menu".visible = !$"../UI/Pause_menu".visible
		get_tree().paused = !get_tree().paused
	elif event.is_action_pressed("Restart"):
		get_tree().reload_current_scene()

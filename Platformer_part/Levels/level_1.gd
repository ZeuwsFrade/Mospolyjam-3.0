extends Node2D

@export var level_id = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_escape_point_body_entered(body: Node2D) -> void:
		if body.name == "Player":
			if level_id == 0:
				GloblalGamePlay.platformer_level_done = true
				GloblalGamePlay.turn_limit = 0
				GloblalGamePlay.ne_stroim = false
			if level_id == 1:
				GloblalGamePlay.platformer_level_done = true
				GloblalGamePlay.turn_limit = 5
				GloblalGamePlay.ne_stroim = false
			if level_id == 2:
				GloblalGamePlay.platformer_level_done = true
				GloblalGamePlay.turn_limit = 5
				GloblalGamePlay.ne_stroim = false
			if level_id == 3:
				GloblalGamePlay.platformer_level_done = true
				GloblalGamePlay.turn_limit = 5
				GloblalGamePlay.ne_stroim = false
			if level_id == 4:
				GloblalGamePlay.platformer_level_done = true
				GloblalGamePlay.turn_limit = 7
				GloblalGamePlay.ne_stroim = false
			if level_id == 5:
				GloblalGamePlay.La_finale = true
			get_tree().change_scene_to_file("res://Menues/loading_screen.tscn")
		

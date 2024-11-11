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
			get_tree().change_scene_to_file("res://Menues/Base_level.tscn")
		

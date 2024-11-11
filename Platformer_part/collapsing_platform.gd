extends CharacterBody2D

@onready var time_to_die = $Timer
var gravity = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if gravity == true:
		velocity += get_gravity() * delta
		move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		time_to_die.start()

func _on_timer_timeout() -> void:
	gravity = true

extends CharacterBody2D

@export var SPEED = 10
@export var Direction = ""
@export var end_position = Vector2()
var moving = 0
var start_position = self.position
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_position = self.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Direction == "Down":
		if moving == 1:
			position.y += SPEED * delta
		elif moving == 2:
			if self.position >= start_position:
				position.y -= SPEED * delta * 0.5
			else:
				moving = 0
	elif Direction == "Up":
		if moving == 1:
			position.y -= SPEED * delta
		elif moving == 2:
			if self.position <= start_position:
				position.y += SPEED * delta * 0.5
			else:
				moving = 0
	elif Direction == "Right":
		if moving == 1:
			position.x += SPEED * delta
		elif moving == 2:
			if self.position >= start_position:
				position.x -= SPEED * delta * 0.5
			else:
				moving = 0
	elif Direction == "Left":
		if moving == 1:
			position.x -= SPEED * delta
		elif moving == 2:
			if self.position <= start_position:
				position.x += SPEED * delta * 0.5
			else:
				moving = 0


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		moving = 1
		print("IN")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		moving = 2
		print("OUT")

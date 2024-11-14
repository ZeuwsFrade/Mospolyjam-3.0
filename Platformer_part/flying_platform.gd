extends CharacterBody2D

@export var SPEED = 10
@export var Direction = ""
@export var end_position = Vector2()
@export var free = false
var moving = 0
var start_position = self.position
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_position = self.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Direction == "Down":
		if moving == 1 and position.y < end_position.y:
			position.y += SPEED * delta
		elif moving == 2:
			if self.position >= start_position:
				position.y -= SPEED * delta * 0.5
			else:
				moving = 0
	elif Direction == "Up" and position.y > end_position.y:
		if moving == 1:
			position.y -= SPEED * delta
		elif moving == 2:
			if self.position <= start_position:
				position.y += SPEED * delta * 0.5
			else:
				moving = 0
	elif Direction == "Right":
		if moving == 1 and position.x < end_position.x:
			position.x += SPEED * delta
		elif moving == 2:
			if self.position >= start_position:
				position.x -= SPEED * delta * 0.5
			else:
				moving = 0
	elif Direction == "Left":
		if moving == 1 and position.x > end_position.x:
			position.x -= SPEED * delta
		elif moving == 2:
			if self.position <= start_position:
				position.x += SPEED * delta * 0.5
			else:
				moving = 0


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		moving = 1

func _on_area_2d_body_exited(body):
	if body.name == "Player" and free == false:
		moving = 2

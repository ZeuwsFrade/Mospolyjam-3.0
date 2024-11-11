extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -600.0
@onready var coyote_timer = $Coyote_time
var last_floor = false
var can_doublejump = true
var double_jumps = 10
@onready var dj = $Double_jumps


func _ready():
	pass
	
func _physics_process(delta: float):
	dj.text = "Double Jumps: " + str(double_jumps)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and (is_on_floor() or !coyote_timer.is_stopped()):
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("ui_accept") and double_jumps != 0:
		double_jumps -= 1
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	last_floor = is_on_floor()
	move_and_slide()
	
	if last_floor and !is_on_floor():
		coyote_timer.start()

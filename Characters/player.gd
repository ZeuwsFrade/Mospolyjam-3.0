extends CharacterBody2D


@export var SPEED = 200.0
@export var JUMP_VELOCITY = -450.0
@onready var coyote_timer = $Coyote_time
var last_floor = false
var double_jumps = 0
@onready var dj = $"../UI/Double_jumps"
@onready var Anim = $Animation

func _ready():
	double_jumps = GloblalGamePlay.double_jump
func _physics_process(delta: float):
	if GloblalGamePlay.double_jump_ability:
		dj.text = "Заряды пара: " + str(double_jumps)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		Anim.play("Jump")

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and (is_on_floor() or !coyote_timer.is_stopped()):
		velocity.y = JUMP_VELOCITY
		Anim.play("Jump")
	elif Input.is_action_just_pressed("ui_accept") and double_jumps != 0 and GloblalGamePlay.double_jump_ability:
		double_jumps -= 1
		$Double_jump.play()
		Anim.play("Jump")
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.x < 0:
			Anim.flip_h = true
		elif velocity.x > 0:
			Anim.flip_h = false
		if is_on_floor():
			Anim.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	last_floor = is_on_floor()
	move_and_slide()
	
	if last_floor and !is_on_floor():
		coyote_timer.start()

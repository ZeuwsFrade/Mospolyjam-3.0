extends Control

@onready var up_points = $Panel/Upgrade_points
@onready var Double_jump = $Panel/Double_jump
@onready var Jump_speed = $Panel/Jump_speed
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	up_points.text = "Очки улучшений: " + str(GloblalGamePlay.upgrade_points)
	if GloblalGamePlay.double_jump == 10:
		Double_jump.text = "Паровые ботинки: " + str(GloblalGamePlay.double_jump) + " MAX"
	else:
		Double_jump.text = "Паровые ботинки: " + str(GloblalGamePlay.double_jump)
	if GloblalGamePlay.jump_upgrade == 3:
		Jump_speed.text = "Паровой экзоскелет: " + str(GloblalGamePlay.jump_upgrade) + " MAX"
	else:
		Jump_speed.text = "Паровой экзоскелет: " + str(GloblalGamePlay.jump_upgrade)
	pass


func _on_dj_up_pressed() -> void:
	if GloblalGamePlay.upgrade_points > 0 and GloblalGamePlay.double_jump < 10:
		GloblalGamePlay.double_jump += 1
		GloblalGamePlay.upgrade_points -= 1

func _on_dj_down_pressed() -> void:
	if GloblalGamePlay.double_jump > 0:
		GloblalGamePlay.upgrade_points += 1
		GloblalGamePlay.double_jump -= 1


func _on_js_up_pressed() -> void:
	if GloblalGamePlay.upgrade_points > 0 and GloblalGamePlay.jump_upgrade < 3:
		GloblalGamePlay.upgrade_points -= 1
		GloblalGamePlay.jump_upgrade += 1


func _on_js_down_pressed() -> void:
	if GloblalGamePlay.jump_upgrade > 0:
		GloblalGamePlay.upgrade_points += 1
		GloblalGamePlay.jump_upgrade -= 1

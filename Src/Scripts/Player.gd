extends KinematicBody2D

export (int) var speed = 350

onready var target = null
var velocity = Vector2()

func _input(event):
	if event.is_action_pressed("click_to_move"):
		target = get_global_mouse_position()

func _physics_process(delta):
	if target != null:
		velocity = position.direction_to(target) * speed
	# look_at(target)
		if position.distance_to(target) > 5:
			velocity = move_and_slide(velocity)

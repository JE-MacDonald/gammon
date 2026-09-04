extends CharacterBody2D


const SPEED: float = 300.0

var target_position: Vector2
var move_flag: bool
var distance: float
var prevDistance: float

func _ready() -> void:
	add_to_group("player")

func reset_movement():
	target_position = Vector2.ZERO
	move_flag = false
	distance = -1
	prevDistance = -1

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		reset_movement()
		target_position = get_global_mouse_position()
		move_flag = true

func _physics_process(_delta: float) -> void:
	if move_flag == true and Gamestate.paused == false:
		prevDistance = distance
		distance = global_position.distance_to(target_position)
		if distance > 0 and (prevDistance > distance or prevDistance == -1):
			velocity = global_position.direction_to(target_position) * SPEED
			move_and_slide()
			if get_slide_collision_count() > 0:
				reset_movement()
		else:
			reset_movement()

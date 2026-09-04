extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	add_to_group("table")

func speak_to_player():
	Gamestate.paused = true
	sprite.texture = load("res://assets/sprites/table alive.png")
	get_tree().get_first_node_in_group("UI").show_message("Oh, yeah, just take it, not like I wanted it anyway.")
	await get_tree().create_timer(4).timeout
	get_tree().get_first_node_in_group("UI").hide_message()
	sprite.texture = load("res://assets/sprites/table.png")
	Gamestate.paused = false

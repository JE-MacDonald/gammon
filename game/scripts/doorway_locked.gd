extends Area2D

@export var destination_room: String
@export var destination_spawn: String

@onready var sprite: Sprite2D = $Sprite2D

func _on_body_entered(body: Node2D) -> void:
	if Gamestate.inv_key == true:
		sprite.texture = load("res://assets/sprites/doorway.png")
		Gamestate.inv_key = false
		
		Gamestate.paused = true
		await get_tree().create_timer(0.5).timeout
		Gamestate.paused = false
		
		var room_manager = get_tree().get_first_node_in_group("room_manager")
		room_manager.change_room(destination_room, destination_spawn)
	else:
		Gamestate.paused = true
		get_tree().get_first_node_in_group("UI").show_message("The door is locked.")
		await get_tree().create_timer(2).timeout
		get_tree().get_first_node_in_group("UI").hide_message()
		Gamestate.paused = false

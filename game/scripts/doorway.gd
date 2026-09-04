extends Area2D

@export var destination_room: String
@export var destination_spawn: String

func _on_body_entered(body: Node2D) -> void:
	var room_manager = get_tree().get_first_node_in_group("room_manager")
	room_manager.change_room(destination_room, destination_spawn)

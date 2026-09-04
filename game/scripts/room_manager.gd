extends Node

@export var starting_room_path: String
@onready var game: Node2D = $".."


var current_room: Node2D
var player: CharacterBody2D

func _ready() -> void:
	add_to_group("room_manager")
	player = game.get_node("player")
	change_room(starting_room_path, "default")

func change_room(room_path: String, spawn_name: String):
	
	#send the player away so old room pos doesnt affect new room
	player.global_position = Vector2(3000, 0)
	
	#remove old room
	if current_room:
		current_room.queue_free()
	
	#add new room
	current_room = load(room_path).instantiate()
	game.add_child.call_deferred(current_room)
	
	#spawn player correctly
	if spawn_name:
		var spawn: Marker2D = current_room.get_node("spawns/"+spawn_name)
		player.global_position = spawn.global_position

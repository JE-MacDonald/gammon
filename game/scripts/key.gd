extends Area2D

@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	if Gamestate.inv_key == true:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	print(body.get_groups())
	if body.is_in_group("player"):
		Gamestate.inv_key = true
		var table = get_tree().get_first_node_in_group("table")
		table.speak_to_player()
		queue_free()

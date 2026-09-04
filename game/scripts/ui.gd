#not working currently

extends CanvasLayer

@onready var textbox: Panel = $textbox
@onready var message: Label = $textbox/message

func _ready() -> void:
	add_to_group("UI")
	textbox.hide()

func show_message(text: String):
	message.text = text
	textbox.show()
	
func hide_message():
	textbox.hide()

extends Node2D


func rotateTile():
	rotation += PI/2

func _on_clickable_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			rotateTile()

extends Node2D

var Rotatable = true
var sparkOntop = false

func _ready():
	randomize()
	randomRotation()
	
func rotateTile():
	if sparkOntop:
		return
	rotation_degrees += 90
	
func randomRotation():
	var rotations = randi() % 4 
	rotation_degrees = rotations * 90

func _on_clickable_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			rotateTile()
		
func _on_body_entered(body):
	if body.is_in_group("player"):
		sparkOntop = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		sparkOntop = false


func _on_area_2d_body_entered(body:) -> void:
	print(body, sparkOntop)
	if body.is_in_group("player"):
		sparkOntop = true


func _on_area_2d_body_exited(body:) -> void:
	if body.is_in_group("player"):
		sparkOntop = false

extends Area2D

@export var levelName : String

func _on_body_entered(body) -> void:
	GameManager.completedLevel()
	print("Test")

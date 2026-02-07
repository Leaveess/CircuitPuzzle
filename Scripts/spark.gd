extends Node2D

var moveCheck = true


func _ready():
	$Area2D.area_entered.connect(sparkEnter)

func sparkEnter(area: Area2D) -> void:
	if not moveCheck:
		return
		
	if area.is_in_group("Output"):
		moveToTile(area)
	
	print("Spark hit - ", area.name)

func moveToTile(Output: Area2D) -> void:
	var nextTile = Output.connectedSide
	
	if nextTile == null:
		return
		
	moveCheck = false
	global_position = nextTile.global_position
	
	await get_tree().create_timer(0.05).timeout
	moveCheck = true

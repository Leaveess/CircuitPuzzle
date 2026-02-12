extends Node

var timer = 0.0
var levelPlaying = false
var CurrentlevelName = ""
var completedLevels = {}

signal levelComplete
signal levelFail
signal timerUpdate(timer)


func levelStart(levelName: String, startTime: float):
	CurrentlevelName = levelName
	timer = startTime
	levelPlaying = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if not levelPlaying:
		return
		
	timer -= delta
	emit_signal("timerUpdate", timer)
	
	if timer <= 0:
		failLevel()

func completedLevel():
	if not levelPlaying:
		return
	levelPlaying = false
	
	completedLevels[CurrentlevelName] = true
	emit_signal("levelComplete")
	
	get_tree().change_scene_to_file("res://Scenes/mainmenu.tscn")
	print(completedLevels)
	
func failLevel():
	levelPlaying = false
	emit_signal("levelFail")
	
	get_tree().reload_current_scene()

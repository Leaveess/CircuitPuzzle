extends Node

var timer = 0.0
var levelPlaying = false
var CurrentlevelName = ""
var completedLevels = {}

signal levelComplete
signal levelFail
signal timerUpdate(timer)

func _ready():
	randomize()

func levelStart(levelName: String, startTime: float):
	CurrentlevelName = levelName
	timer = startTime
	levelPlaying = true
	
	#rotateRandom()

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
	emit_signal("levelComplete")
	
func failLevel():
	levelPlaying = false
	emit_signal("levelFail")

#func rotateRandom():

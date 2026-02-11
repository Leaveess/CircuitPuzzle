extends CanvasLayer

@onready var Timerlabel = $MarginContainer/Timerlabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.timerUpdate.connect(_on_timerUpdate)
	GameManager.levelFail.connect(_on_levelFail)
	GameManager.levelComplete.connect(_on_levelComplete)
	
func _on_timerUpdate(timer):
	Timerlabel.text = str(ceil(timer))

func _on_levelComplete():
	Timerlabel.text = "Comeplete"

func _on_levelFail():
	Timerlabel.text = "Times out"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

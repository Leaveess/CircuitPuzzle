extends CharacterBody2D

const tile_size: Vector2 = Vector2(32,32)
var sprite_node_pos_tween: Tween

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("up") and not $up.is_colliding():
		_move(Vector2(0,-1))
		print("Moved Up")
	elif Input.is_action_just_pressed("down") and not $down.is_colliding():
		_move(Vector2(0,1))
		print("Moved Down")
	elif Input.is_action_just_pressed("left") and not $left.is_colliding():
		_move(Vector2(-1,0))
		print("Moved left")
	elif Input.is_action_just_pressed("right") and not $right.is_colliding():
		_move(Vector2(1,0))
		print("Moved Right")

func _move(dir: Vector2):
	global_position += dir * tile_size

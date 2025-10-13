extends AnimatedSprite2D

var speed = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("walk_right"):
		position.x += speed
		play("walk")
		flip_h = false
		
	elif Input.is_action_pressed("walk_left"):
		position.x -= speed
		play("walk")
		flip_h = true
	else:
		play("default")
	pass

extends Node2D

@export var speed = 0.1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Path2D/PathFollow2D.progress_ratio += (speed*0.001)

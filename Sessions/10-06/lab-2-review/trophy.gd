extends Sprite2D

signal trophy_collected

@export var points = 100


func _on_area_2d_area_entered(area: Area2D) -> void:
	print('woo hoo!')
	trophy_collected.emit(points)
	queue_free()

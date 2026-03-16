extends AnimatedSprite2D

@export var points = 5



func _on_area_2d_body_entered(body):
	if body.name == 'Player':
		play("pop")
		body.update_score(points)




func _on_animation_finished():
	if animation == "pop":
		queue_free()


func damage(amount):
	play('pop')

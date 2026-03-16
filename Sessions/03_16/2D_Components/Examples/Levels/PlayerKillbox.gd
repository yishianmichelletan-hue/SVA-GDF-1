extends Area2D






func _on_body_entered(body):
	print(body)
	
	if body.name == "Player":
		body.kill()
	else:
		body.queue_free()
	
	
	#print("test change")
	
	

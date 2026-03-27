extends Area2D






func _on_body_entered(body):
	
	if body.name== "Player":
		#get_tree().reload_current_scene() 
		body.kill() # if it gets kill the player returns to same place , and keeps ur score
	else :
		body.queue_free()
		
	body.position = $"../Respawn".position
	print("test change")
	
	

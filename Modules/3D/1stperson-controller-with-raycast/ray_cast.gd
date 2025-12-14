extends RayCast3D

var current_object

func _physics_process(delta: float) -> void:
	var thing = get_collider()
	if thing:
		if thing.is_in_group('proof'):
			thing.show_text()
			current_object = thing
	else:
		if current_object:
			current_object.hide_text()
			current_object = null

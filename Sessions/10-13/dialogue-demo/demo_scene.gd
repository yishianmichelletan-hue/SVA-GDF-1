extends Node2D

const DIALOGUE_BOX = preload("uid://dx4kiln7clck5")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		var dialogue_node = DIALOGUE_BOX.instantiate()
		dialogue_node.dialogue_line = 'something new!'
		add_child(dialogue_node)

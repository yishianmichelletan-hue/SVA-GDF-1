extends PanelContainer
@export var my_dialogue : Array[String]


var current_line = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(my_dialogue)
	$HBoxContainer/Dialogue.text = my_dialogue[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		current_line += 1
		$HBoxContainer/Dialogue.text = my_dialogue[current_line]

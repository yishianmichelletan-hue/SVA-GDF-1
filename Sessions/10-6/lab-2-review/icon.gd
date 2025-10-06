extends Sprite2D

var score = 0

@export var speed = 1
@export var health = 10

@export var moving_horizontally = true


func _ready() -> void:
	print('hello im ready to go')

func _process(delta: float) -> void:
	
	if Input.is_action_pressed("ui_down"):
		position.y += speed
	if Input.is_action_pressed("ui_up"):
		position.y -= speed
	if Input.is_action_pressed("ui_left"):
		position.x -= speed
	if Input.is_action_pressed("ui_right"):
		position.x += speed
	
	if Input.is_action_just_pressed("ui_accept"):
		score += 1
		print(score)
		var score_label = get_node("Label")
		score_label.text = str("Score: ",score)
		
	#if moving_horizontally == true:
		#position.x = position.x + speed
	#else:
	#


func _on_trophy_trophy_collected(points) -> void:
	score += points
	var score_label = get_node("Label")
	score_label.text = str("Score: ",score)
	pass # Replace with function body.

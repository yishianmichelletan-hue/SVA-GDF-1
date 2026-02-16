extends Sprite2D

@export var speed = 10.0

@export var my_name = ""

@export var moving = false

#Called when the node enters the scene tree for the first time.

func _ready() -> void:
	
	print("Hello world!") 
	print('my name is ', my_name)
	print('am i moving is', moving)


#func _input(event: InputEvent) -> void:
	#print(event)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_pressed("ui_accept"):
		#position.x += speed
	#else:
		#position.x -= speed

	if Input.is_action_pressed("ui_up"):
		position.y -= speed
	if Input.is_action_pressed("ui_down"):
		position.y += speed
	if Input.is_action_pressed("ui_right"):
		position.x += speed
	if Input.is_action_pressed("ui_left"):
		position.x -= speed

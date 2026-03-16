extends CharacterBody2D

@export var speed = 500
@onready var ground: TileMapLayer = $"../Ground"

var step_size = 16


func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("walk_down"):
		position.y -= step_size
		velocity.y = speed
		$AnimatedSprite2D.play("walk_down")
	
	if Input.is_action_pressed("walk_up"):
		velocity.y = -speed
		$AnimatedSprite2D.play("walk_up")
		
	if Input.is_action_pressed("walk_right"):
		velocity.x  = speed
		$AnimatedSprite2D.play("walk_right")
		
	if Input.is_action_pressed("walk_left"):
		velocity.x  = -speed
		$AnimatedSprite2D.play("walk_left")
	
	if not Input.is_anything_pressed():
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("default")
	

	
	move_and_slide()
	var cell = ground.local_to_map(position)
	position = ground.map_to_local(cell)

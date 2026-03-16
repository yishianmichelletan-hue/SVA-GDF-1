extends CharacterBody2D

var score = 0
@export var points_needed = 100
#var respawn_location = Vector2.ZERO
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite_2d = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var alive = true





func _physics_process(delta):
	# Add the gravity.
	if alive:
		if not is_on_floor():
			velocity.y += gravity * delta

		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
			animated_sprite_2d.play("run")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()
	
	
	
		if velocity.x < 0:
			animated_sprite_2d.flip_h = true
		elif velocity.x > 0:
			animated_sprite_2d.flip_h = false
		elif velocity == Vector2.ZERO:
			animated_sprite_2d.play("idle")


func kill():
	alive = false
	animated_sprite_2d.play("death")
	


func _on_animated_sprite_2d_animation_finished():
	print(animated_sprite_2d.animation)
	if animated_sprite_2d.animation == "death":
		position = Vector2(0,0)
		animated_sprite_2d.play("idle")
		position = $"../Respawn".position
		alive = true
	#

func update_score(amount):
	score += amount
	
	$CanvasLayer/Score.text = str("Score: ",score)
	if score >= points_needed or score <= 400:
		get_tree().change_scene_to_file("res://Examples/Levels/respawn_demo_level2.tscn")

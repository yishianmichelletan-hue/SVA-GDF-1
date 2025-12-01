extends CharacterBody3D
@export var speed = 200.0
@onready var navigation_agent_3d = $NavigationAgent3D
@onready var marker_3d = $"../Marker3D"
var at_destination = false
# Called when the node enters the scene tree for the first time.
func _ready():
	navigation_agent_3d.target_position = marker_3d.position
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float):
	if not is_on_floor():
		velocity += get_gravity() *delta
	if not at_destination:
		var next_pos = navigation_agent_3d.get_next_path_position()
		var new_velocity = global_position.direction_to(next_pos)
		velocity = new_velocity*speed
		move_and_slide()
	


func _on_navigation_agent_3d_target_reached() -> void:
	at_destination = true

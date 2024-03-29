extends KinematicBody2D

export (int) var rotation_speed = 2
var rotation_direction = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func i_am_reflective() -> bool:
	return true


# Allow other scripts to update the rotation direction
func set_rotation_direction(rotation_dir):
	rotation_direction = rotation_dir

func show_mirror():
	visible = true
	get_node("ReflectiveCollision").disabled = false
	get_node("KinematicBody2D/LightOccluder2D").visible = true
	get_node("KinematicBody2D/CollisionShape2D").disabled = false


func hide_mirror():
	visible = false
	get_node("ReflectiveCollision").disabled = true
	get_node("KinematicBody2D/LightOccluder2D").visible = false
	get_node("KinematicBody2D/CollisionShape2D").disabled = true


# Function to process motion
func _physics_process(delta):
	
	#rotation += rotation_direction * rotation_speed * delta
	rotate(rotation_direction * rotation_speed * delta)

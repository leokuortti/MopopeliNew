extends RigidBody2D

# Variables
var wheels = []
@export var speed: float = 250000  # Adjust this value as needed
@export var max_speed: float = 10000  # Maximum speed for the wheels
@export var back_speed: float = 3000  # Reverse speed adjustment
@export var move_speed: float = 500.0  # General movement speed

# Called when the node is ready
func _ready() -> void:
	wheels = get_tree().get_nodes_in_group("wheel")

# Handle physics and input
func _physics_process(delta: float) -> void:
	var torque_value = speed * delta

	# Move right
	if Input.is_action_pressed("move_right"):
		apply_torque_impulse(-torque_value)  # Apply torque for right movement
		for wheel in wheels:
			if wheel.angular_velocity < max_speed:
				wheel.apply_torque_impulse(torque_value)  # Apply torque to wheels

	# Move left
	if Input.is_action_pressed("move_left"):
		apply_torque_impulse(torque_value)  # Apply torque for left movement
		for wheel in wheels:
			if wheel.angular_velocity < max_speed:
				wheel.apply_torque_impulse(-torque_value)  # Apply torque to wheels

	# Restart level
	if Input.is_action_just_pressed("restart"):
		restart_level()

# Reloads the current level
func restart_level() -> void:
	var current_scene = get_tree().current_scene
	if current_scene:
		get_tree().reload_current_scene()

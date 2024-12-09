extends RigidBody2D

var wheels = []
var speed = 100000 # Adjust this value
var max_speed = 10000  # Adjust for maximum wheel speed
var back_speed = 3000  # Adjust if needed

func _ready():
	wheels = get_tree().get_nodes_in_group("wheel")

func _process(delta: float) -> void:
	var torque_value = speed * delta

	if Input.is_action_pressed("ui_right"):
		apply_torque_impulse(-torque_value)  # Apply torque for right
		for wheel in wheels:
			if wheel.angular_velocity < max_speed:
				wheel.apply_torque_impulse(torque_value)  # Apply torque to wheels

	if Input.is_action_pressed("ui_left"):
		apply_torque_impulse(torque_value)  # Apply torque for left
		for wheel in wheels:
			if wheel.angular_velocity < max_speed:
				wheel.apply_torque_impulse(-torque_value)  # Apply torque to wheels

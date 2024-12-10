extends RigidBody2D

# Variables
var wheels = []
@export var speed: float = 250000  # Adjust this value as needed
@export var max_speed: float = 10000  # Maximum speed for the wheels
@export var back_speed: float = 5000  # Reverse speed adjustment
@export var move_speed: float = 500.0  # General movement speed

var driving = 0

# Called when the node is ready
func _ready() -> void:
	wheels = get_tree().get_nodes_in_group("wheel")
	
	$EngineSFX.play()

	# Create the head area hitbox
	var head_area = Area2D.new()
	var head_shape = CollisionShape2D.new()
	head_shape.shape = RectangleShape2D.new()  # Define the shape for the head hitbox
	head_area.add_child(head_shape)
	head_area.position = Vector2(0, -50)  # Adjust position above the vehicle's body
	add_child(head_area)

	# Connect the signal to detect collisions
	head_area.connect("body_entered", Callable(self, "_on_head_hit"))  # Correct usage of Callable

# Handle physics and input
func _physics_process(delta: float) -> void:
	driving = 0
	var torque_value = speed * delta

	# Move right
	if Input.is_action_pressed("move_right"):
		driving += 1
		apply_torque_impulse(-torque_value)  # Apply torque for right movement
		for wheel in wheels:
			if wheel.angular_velocity < max_speed:
				wheel.apply_torque_impulse(torque_value)  # Apply torque to wheels

	# Move left
	if Input.is_action_pressed("move_left"):
		driving += 1
		apply_torque_impulse(torque_value)  # Apply torque for left movement
		for wheel in wheels:
			if wheel.angular_velocity < max_speed:
				wheel.apply_torque_impulse(-torque_value)  # Apply torque to wheels

	# Restart level
	if Input.is_action_just_pressed("restart"):
		restart_level()

	if driving == 1:
		$EngineSFX.pitch_scale = lerp($EngineSFX.pitch_scale, 2.0, 2.0 * delta)
	else:
		$EngineSFX.pitch_scale = lerp($EngineSFX.pitch_scale, 1.0, 2.0 * delta)
# Reloads the current level
func restart_level() -> void:
	var current_scene = get_tree().current_scene
	if current_scene:
		get_tree().reload_current_scene()

func _on_head_area_body_entered(body: Node) -> void:
	if body.is_in_group("Ground"):  # Ensure the ground nodes are in the "Ground" group
		print("Head hit the ground!")
		get_tree().reload_current_scene()

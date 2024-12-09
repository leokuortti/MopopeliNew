extends Node  # Change to the appropriate node type for your settings menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Initialize the volume slider to the current volume level
	var current_volume = AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	$HSlider.value = db2linear(current_volume)  # Assuming HSlider is the name of your slider node

# Adjust volume using the slider
func _on_h_slider_value_changed(value: float) -> void:
	# Set volume for the "Master" bus (which is the default bus)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(value))

# Mute button toggle
func _on_mute_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		# Mute the master bus by setting the volume to a low value
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -80)  # -80 dB is basically muted
	else:
		# Restore the volume, assuming you have a default volume value (like 0 dB)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)  # 0 dB is full volume

# Change resolution based on dropdown selection
func _on_resolution_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920, 1080))  # 1920x1080 resolution
		1:
			DisplayServer.window_set_size(Vector2i(1600, 900))   # 1600x900 resolution
		2:
			DisplayServer.window_set_size(Vector2i(1280, 720))   # 1280x720 resolution
	# Center the window after setting the resolution
	DisplayServer.center_window()

# Helper function to convert linear volume (slider value) to decibels
func linear2db(value: float) -> float:
	if value <= 0:
		return -80  # Mute if value is 0 or negative
	return 20 * log(value) / log(10)  # Use log for base 10 conversion

# Helper function to convert decibels to linear volume
func db2linear(db: float) -> float:
	return 10.0 ** (db / 20.0)

extends Node


# Called when the node enters the scene tree for the first time.
var is_muted: bool = false  # Variable to hold the mute state

# Called when the singleton is initialized
func _ready():
	update_audio_state()

# Toggle mute state
func toggle_mute():
	is_muted = !is_muted
	update_audio_state()

# Apply the mute/unmute to the audio
func update_audio_state():
	if is_muted:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -80)  # Mute audio
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)  # Restore volume

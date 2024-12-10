extends Control


func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value)


@onready var mute_checkbox = $MuteCheckbox  # Path to your mute checkbox node

# This function is called when the checkbox is toggled
func _on_mute_toggled(toggled_on: bool) -> void:
	AudioManager.is_muted = toggled_on
	AudioManager.update_audio_state()  # Apply the mute/unmute effect globally

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

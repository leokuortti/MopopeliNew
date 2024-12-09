extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$OptionsMenu.hide()  # Hide options menu when the game starts

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Start button pressed - change to the game scene
func _on_start_pressed() -> void:
	get_tree().change_scene("res://path_to_your_game_scene.tscn")  # Change to your game scene
	print("Start pressed")

# Options button pressed - switch to the options menu
func _on_options_pressed() -> void:
	$Menu.hide()  # Hide the main menu
	$OptionsMenu.show()  # Show the options menu

# Exit button pressed - quit the game
func _on_exit_pressed() -> void:
	print("Exit pressed")
	get_tree().quit()  # Quit the game

# Volume slider value changed - update audio bus volume
func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(value))  # Adjust master volume
	print("Volume changed: ", value)

# Checkbox toggled - toggle fullscreen mode
func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)  # Enable fullscreen
		print("Fullscreen enabled")
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)  # Disable fullscreen
		print("Fullscreen disabled")

# Helper function to convert slider value to decibels
func linear2db(value: float) -> float:
	if value == 0:
		return -80  # Mute when slider is at 0
	return 20 * Mathf.log10(value)  # Correct use of Mathf.log10

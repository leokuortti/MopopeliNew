extends Button

# Constants for button text
const FULLSCREEN_TEXT = "Switch to Fullscreen"
const WINDOWED_TEXT = "Switch to Windowed"

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	update_button_text()
	
	# Connect the button's pressed signal to toggle fullscreen
	self.pressed.connect(_on_button_pressed)

# Function to update button text based on the current fullscreen state
func update_button_text() -> void:
	# Check if the window is currently in fullscreen mode
	if DisplayServer.window_get_fullscreen():
		text = WINDOWED_TEXT
	else:
		text = FULLSCREEN_TEXT

# Function to toggle fullscreen and update the button text
func _on_button_pressed() -> void:
	# Get the current fullscreen state
	var is_fullscreen = DisplayServer.window_get_fullscreen()
	
	# Switch fullscreen mode
	DisplayServer.window_set_fullscreen(!is_fullscreen)
	
	# Update the button text to reflect the new state
	update_button_text()

# Example of defining a GDScriptNativeClass
static func example_native_function() -> void:
	print("This is an example of a native GDScript function.")

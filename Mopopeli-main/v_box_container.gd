extends Control  # Ensure this is a Node class

# Declare variables at the top to ensure they are in scope
var volume_slider: HSlider
var resolution_dropdown: OptionButton

func _ready() -> void:
	# Get reference to the VBoxContainer
	var vbox = get_node("VBoxContainer")  # Use get_node() explicitly
	
	# Set the separation (gap) between elements
	vbox.set("custom_constants/separation", 30)
	
	# Create and add a Label for the Volume slider
	var volume_label = Label.new()
	volume_label.text = "Volume"
	vbox.add_child(volume_label)
	
	# Create and add the Volume Slider
	volume_slider = HSlider.new()  # Store reference in the variable
	volume_slider.size_flags_horizontal = Control.SIZE_EXPAND | Control.SIZE_FILL
	volume_slider.min_value = 0.0
	volume_slider.max_value = 1.0
	volume_slider.step = 0.01
	# Connect to the signal correctly
	volume_slider.connect("value_changed", Callable(self, "_on_volume_slider_value_changed"))
	vbox.add_child(volume_slider)
	
	# Create and add a Label for the Resolution dropdown
	var resolution_label = Label.new()
	resolution_label.text = "Resolution"
	vbox.add_child(resolution_label)
	
	# Create and add the Resolution dropdown (OptionButton)
	resolution_dropdown = OptionButton.new()  # Store reference in the variable
	resolution_dropdown.add_item("1920x1080", 0)
	resolution_dropdown.add_item("1600x900", 1)
	resolution_dropdown.add_item("1280x720", 2)
	resolution_dropdown.size_flags_horizontal = Control.SIZE_EXPAND | Control.SIZE_FILL
	# Connect to the signal correctly
	resolution_dropdown.connect("item_selected", Callable(self, "_on_resolution_dropdown_item_selected"))
	vbox.add_child(resolution_dropdown)

# Signal handling functions
func _on_volume_slider_value_changed(value: float) -> void:
	print("Volume changed to: ", value)

func _on_resolution_dropdown_item_selected(index: int) -> void:
	print("Resolution selected: ", resolution_dropdown.get_item_text(index))

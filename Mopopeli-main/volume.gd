extends HSlider


func _ready():
	# Background style (thick slider)
	var background_style = StyleBoxFlat.new()
	background_style.bg_color = Color(0.3, 0.3, 0.3)  # Dark gray
	background_style.content_margin_top = 20  # Thickness
	background_style.content_margin_bottom = 20
	$HSlider.add_stylebox_override("background", background_style)

	# Grabber style (big circular grabber)
	var grabber_style = StyleBoxFlat.new()
	grabber_style.bg_color = Color(0.8, 0.1, 0.1)  # Red color
	grabber_style.content_margin_top = 15  # Size of grabber
	grabber_style.content_margin_bottom = 15
	$HSlider.add_stylebox_override("grabber", grabber_style)

	# Center the slider in the parent container
	$CenterContainer.anchor_left = 0.1
	$CenterContainer.anchor_right = 0.9
	$CenterContainer.anchor_top = 0.4
	$CenterContainer.anchor_bottom = 0.6

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

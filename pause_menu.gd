extends Control

@onready var blur = $ColorRect  # Assuming your ColorRect is a child of the pause menu

func _ready():
	$AnimationPlayer.play("RESET")
	blur.visible = false

func resume():
	blur.visible = false
	get_tree().paused = false
	$AnimationPlayer.play_backwards("Blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("Blur")
	blur.visible = true

func testEsc():
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("escape") and get_tree().paused == true:
		resume()


func _on_resume_pressed() -> void:
	resume()


func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


func _on_settings_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://settings.tscn")


func _on_main_menu_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://menu.tscn")

func _process(delta):
	testEsc()

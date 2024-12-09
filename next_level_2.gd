extends Node2D


func _on_next_level_2_pressed():
	get_tree().change_scene_to_file("res://Kentat/kentta_3.tscn")


func _on_menu_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")

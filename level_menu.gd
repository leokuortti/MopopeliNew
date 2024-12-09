extends Node2D


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Kentat/kentta_1.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Kentat/kentta_2.tscn")


func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Kentat/kentta_3.tscn")


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")

extends Node2D


func _on_nextlevel_pressed(): 
	get_tree().change_scene_to_file("res://Kentat/kentta_2.tscn")


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")

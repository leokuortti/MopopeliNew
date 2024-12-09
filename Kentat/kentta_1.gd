extends Node2D


func _on_maali_body_entered(body: Node2D):
	get_tree().change_scene_to_file("res://level_menu_1.tscn")

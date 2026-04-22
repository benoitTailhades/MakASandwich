extends Node

var main_scene_path: String = "res://scenes/game.tscn"


func lauch_game()->void:
	get_tree().change_scene_to_file(main_scene_path)
	
	
	

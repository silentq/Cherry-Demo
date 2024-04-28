extends Node2D


func _ready():
	Game.Cherry = 0
	Game.Goal = 11
	Game.Current_Level = "res://Levels/level_7.tscn"
	Game.next_level_number = 0
	Game.current_level_number = 7
	$Timer.start(Game.current_time)


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Levels/lose.tscn")

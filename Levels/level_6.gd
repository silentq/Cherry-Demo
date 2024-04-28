extends Node2D


func _ready():
	Game.Cherry = 0
	Game.Goal = 9
	Game.Next_Level = "res://Levels/level_7.tscn"
	Game.Current_Level = "res://Levels/level_6.tscn"
	Game.next_level_number = 7
	Game.current_level_number = 6
	$Timer.start(Game.current_time)


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Levels/lose.tscn")

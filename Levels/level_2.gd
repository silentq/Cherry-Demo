extends Node2D


func _ready():
	Game.Cherry = 0
	Game.Goal = 12
	Game.Next_Level = "res://Levels/level_3.tscn"
	Game.Current_Level = "res://Levels/level_2.tscn"
	Game.next_level_number = 3
	Game.current_level_number = 2
	$Timer.start(Game.current_time)


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Levels/lose.tscn")

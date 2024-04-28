extends Node2D


func _ready():
	Game.Cherry = 0
	Game.Goal = 20
	Game.Next_Level = "res://Levels/level_5.tscn"
	Game.Current_Level = "res://Levels/level_4.tscn"
	Game.next_level_number = 5
	Game.current_level_number = 4
	$Timer.start(Game.current_time)


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Levels/lose.tscn")

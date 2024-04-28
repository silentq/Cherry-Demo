extends Node2D



func _ready():
	Game.Cherry = 0
	Game.Goal = 1
	Game.Next_Level = "res://Levels/level_6.tscn"
	Game.Current_Level = "res://Levels/level_5.tscn"
	Game.next_level_number = 6
	Game.current_level_number = 5
	$Timer.start(Game.current_time)


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Levels/lose.tscn")

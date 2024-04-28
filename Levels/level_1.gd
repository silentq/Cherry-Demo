extends Node2D

var time_left = float()

# Called when the node enters the scene tree for the first time.
func _ready():
	Game.Cherry = 0
	Game.Goal = 20
	Game.Next_Level = "res://Levels/level_2.tscn"
	Game.Current_Level = "res://Levels/level_1.tscn"
	Game.next_level_number = 2
	Game.current_level_number = 1
	$Timer.start(Game.new_game_time)
	
func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Levels/lose.tscn")
	


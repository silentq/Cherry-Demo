extends Node


var playerHP = 1
var Cherry = 0
var Goal = -1
var Next_Level = "res://Levels/level_1.tscn"
var Current_Level
var current_level_number
var timer = float(120.0)
var new_game_time = float(120.0)
var current_time = timer
var next_level_number = 1
var fullscreen = false
var collectable_sound = false
var Cherry_Sound = false


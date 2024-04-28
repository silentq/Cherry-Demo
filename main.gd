extends Node2D


func _ready():
	$Play.grab_focus()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")


func _on_quit_pressed():
	get_tree().quit()




func _on_screen_pressed():
	if Game.fullscreen == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		Game.fullscreen = true
	elif Game.fullscreen == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		Game.fullscreen = false

func nav():
	if Input.is_action_just_pressed("ui_accept"):
		$Confirm.play()
	if Input.is_action_just_pressed("ui_up"):
		$Select.play()
	if Input.is_action_just_pressed("ui_down"):
		$Select.play()
		
func _process(delta):
	nav()

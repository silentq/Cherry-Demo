extends Control

func _ready():
	$".".hide()

func resume():
	get_tree().paused = false

func pause():
	get_tree().paused = true
	
func testecape():
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		pause()
		$".".show()
		$Resume.grab_focus()
	elif Input.is_action_just_pressed("escape") and get_tree().paused == true:
		resume()
		$".".hide()

func _on_resume_pressed():
	resume()
	$".".hide()


func _on_restart_pressed():
	resume()
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
	if get_tree().paused == true and Input.is_action_just_pressed("ui_accept"):
		$Confirm.play()
	if get_tree().paused == true and Input.is_action_just_pressed("ui_up"):
		$Select.play()
	if get_tree().paused == true and Input.is_action_just_pressed("ui_down"):
		$Select.play()
		
func _process(delta):
		testecape()
		nav()

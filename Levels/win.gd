extends Node2D

func _ready():
	$Cherry_Collect.play()
	$Button.grab_focus()



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")


func _on_button_2_pressed():
	get_tree().quit()
	
func nav():
	if Input.is_action_just_pressed("ui_accept"):
		$Confirm.play()
	if Input.is_action_just_pressed("ui_up"):
		$Select.play()
	if Input.is_action_just_pressed("ui_down"):
		$Select.play()
		
func _process(delta):
	nav()

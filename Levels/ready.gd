extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Cherry_Collect.play()
	$Button.grab_focus()





func _on_button_pressed():
	get_tree().change_scene_to_file(Game.Next_Level)

func nav():
	if Input.is_action_just_pressed("ui_accept"):
		$Confirm.play()
		
func _process(delta):
	nav()

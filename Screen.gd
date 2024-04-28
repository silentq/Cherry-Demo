extends Button


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Game.fullscreen == false:
		text = "Fullscreen"
	elif Game.fullscreen == true:
		text = "Windowed"

extends CharacterBody2D

var timer
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var JUMP_COUNT = 0
var JUMP_MAX = 2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


@onready var anim = get_node("AnimationPlayer")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		print(JUMP_COUNT)
		
	#JUMP_COUNT RESET FLOOR AND WALL
	if is_on_floor() or is_on_wall():
		JUMP_COUNT = 0
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and JUMP_COUNT < JUMP_MAX:
		velocity.y = JUMP_VELOCITY
		JUMP_COUNT += 1
		if JUMP_COUNT == 1:
			anim.play("Jump")
			$Jump.play()
		elif JUMP_COUNT == 2:
			anim.play("Double_Jump")
			$Jump.play()
		print(JUMP_COUNT)
		
	#Handel Wall Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_wall():
		anim.play("Wall_Jump")
		$Jump.play()
		print(JUMP_COUNT)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1: 
		get_node("AnimatedSprite2D").flip_h = false
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("Idle")
	if velocity.y > 0:
		anim.play("Fall")

	move_and_slide()
	
	if Game.Cherry_Sound == true:
		$Cherry_Collect.play()
		Game.Cherry_Sound = false
	
	
	if Game.Cherry == Game.Goal:
		queue_free()
		if Game.next_level_number < 1:
			$"../Timer".stop()
			get_tree().change_scene_to_file("res://Levels/win.tscn")
		elif Game.next_level_number >= 1:
			get_tree().change_scene_to_file("res://Levels/ready.tscn")
			$"../Timer".stop()

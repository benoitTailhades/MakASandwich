extends CharacterBody2D

@export var mouvment_speed : float = 100

var character_direction : String  = "Down"

func _physics_process(delta: float) -> void:
	player_movement()
	


func player_movement():
	if Input.is_action_pressed("move_right"):
		character_direction = "Right"
		velocity.x = mouvment_speed
		velocity.y = 0
		%sprite.animation = character_direction
		
	elif Input.is_action_pressed("move_left"):
		character_direction = "Left"
		velocity.x = - mouvment_speed
		velocity.y = 0
		%sprite.animation = character_direction
	elif Input.is_action_pressed("move_up"):
		character_direction = "Up"
		velocity.y = -mouvment_speed
		velocity.x = 0
		%sprite.animation = character_direction
	elif Input.is_action_pressed("move_down"):
		character_direction = "Down"
		velocity.y = mouvment_speed
		velocity.x = 0
		%sprite.animation = character_direction
	else:
		velocity.y = 0
		velocity.x = 0
		%sprite.animation = character_direction+"-Idle"
	move_and_slide()


		

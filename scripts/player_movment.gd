extends CharacterBody2D

@export var mouvment_speed : float = 500

var character_direction : Vector2

func _physics_process(delta: float) -> void:
	
	character_direction.x = Input.get_axis("move_left","move_right")
	character_direction.y = Input.get_axis("move_up","move_down")
	
	if character_direction.x > 0:
		%sprite.animation = "Right"
	elif character_direction.x < 0:
		%sprite.animation = "Left"
	elif character_direction.y > 0:
		%sprite.animation = "Down"
	elif character_direction.y < 0:
		%sprite.animation = "Up"
	
	if character_direction:
		velocity = character_direction * mouvment_speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO,mouvment_speed)
	
	move_and_slide()

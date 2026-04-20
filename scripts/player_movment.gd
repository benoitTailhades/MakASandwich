extends CharacterBody2D

@export var mouvment_speed : float = 100
var character_direction : String = "Down"
@export var inv: Inv

# Limites à définir depuis world.gd
var limit_left : float = -480
var limit_right : float = 2832
var limit_top : float = -976
var limit_bottom : float = 320

func _physics_process(delta: float) -> void:
	player_movement()
	player_animation()

func player_movement():
	if Input.is_action_pressed("move_right"):
		character_direction = "Right"
		velocity.x = mouvment_speed
		velocity.y = 0
	elif Input.is_action_pressed("move_left"):
		character_direction = "Left"
		velocity.x = -mouvment_speed
		velocity.y = 0
	elif Input.is_action_pressed("move_up"):
		character_direction = "Up"
		velocity.y = -mouvment_speed
		velocity.x = 0
	elif Input.is_action_pressed("move_down"):
		character_direction = "Down"
		velocity.y = mouvment_speed
		velocity.x = 0
	else:
		velocity.y = 0
		velocity.x = 0

	move_and_slide()

	position.x = clamp(position.x, limit_left, limit_right)
	position.y = clamp(position.y, limit_top, limit_bottom)

func collect(item):
	inv.insert(item)

func player_animation():
	%sprite.animation = character_direction

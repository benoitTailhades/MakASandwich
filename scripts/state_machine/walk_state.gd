 
extends NodeState

@export var player : Player
@export var animated_sprite_2d : AnimatedSprite2D
@export var speed: int = 150

var direction : Vector2
var limit_left : float = -480
var limit_right : float = 2832
var limit_top : float = -976
var limit_bottom : float = 320

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()
	
	if direction == Vector2.UP:
		animated_sprite_2d.play("Up")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("Down")
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play("Left")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("Right")
		
	if direction != Vector2.ZERO:
		player.player_direction = direction 
		
	player.velocity = direction * speed
	player.position.x = round(clamp(player.position.x,limit_left,limit_right))
	player.position.y = round(clamp(player.position.y,limit_top,limit_bottom))
	player.move_and_slide()
	


func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()

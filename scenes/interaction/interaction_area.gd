extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"

var _ready_flag: bool = false

var interact: Callable = func():
	pass
	
func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	await get_tree().process_frame  # wait one frame before trusting signals
	_ready_flag = true

func _on_body_entered(body: Node2D) -> void:
	if not _ready_flag:
		return
	if not body.is_in_group("player"):  # ← only register if it's the player
		return
	InteractionManager.register_area(self)
	
func _on_body_exited(body: Node2D) -> void:
	if not body.is_in_group("player"):  # ← same here
		return
	InteractionManager.unregister(self)

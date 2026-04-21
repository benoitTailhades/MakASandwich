extends PanelContainer

@onready var base_table: Button = $MarginContainer/VBoxContainer/BaseTable
@onready var oven: Button = $MarginContainer/VBoxContainer/Oven

var base_table_scene = preload("res://scenes/objects/structures/BaseTable.tscn")
var base_oven_scene = preload("uid://cxdtlpti8yl1p")


func _process(delta: float) -> void:
	InventoryManager.inventory.get_or_add("log", 0)
	InventoryManager.inventory.get_or_add("stone", 0)
	

	if InventoryManager.inventory["log"] >= 5:
		base_table.disabled = false
	else:
		base_table.disabled = true
		
	if InventoryManager.inventory["stone"] >= 5:
		oven.disabled = false
	else:
		oven.disabled = true

func _on_base_table_pressed() -> void:
	if InventoryManager.inventory["log"] != null:
		if InventoryManager.inventory["log"] >= 5:
			for i in range(5):
				InventoryManager.remove_collectable("log")
			_place_object(base_table_scene)
	
func _place_object(scene: PackedScene) -> void:
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return

	var instance = scene.instantiate()

	# Add to Game node so it sits alongside Player, Chickens, etc.
	get_tree().current_scene.add_child(instance)

	# 1 block below the player
	var offset = player.player_direction.normalized()
	if offset == Vector2.ZERO:
		offset = Vector2.DOWN
	instance.position = player.position + offset * 32  # adjust 32 to your tile size
	
func _on_oven_pressed() -> void:
	if InventoryManager.inventory["stone"] != null:
		if InventoryManager.inventory["stone"] >= 5:
			for i in range(5):
				InventoryManager.remove_collectable("stone")
			_place_object(base_oven_scene)

extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var sprite = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Disable the area until player has moved away
	interaction_area.monitoring = false

	await get_tree().create_timer(0.5).timeout

	interaction_area.monitoring = true
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if InventoryManager.inventory["bread"] != null && InventoryManager.inventory["salad"] != null && InventoryManager.inventory["tomato"] != null && InventoryManager.inventory["chicken"] != null:
		if InventoryManager.inventory["bread"] >= 1 && InventoryManager.inventory["salad"] >= 1 && InventoryManager.inventory["tomato"] >= 1 && InventoryManager.inventory["chicken"] >= 1:
			InventoryManager.remove_collectable("bread")
			InventoryManager.remove_collectable("salad")
			InventoryManager.remove_collectable("tomato")
			InventoryManager.remove_collectable("chicken")
			InventoryManager.add_collectable("sandwich")

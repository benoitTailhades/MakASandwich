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
	if InventoryManager.inventory["corn"] != null:
		if InventoryManager.inventory["corn"] >= 5:
			for i in range(5):
				InventoryManager.remove_collectable("corn")
			InventoryManager.add_collectable("bread")

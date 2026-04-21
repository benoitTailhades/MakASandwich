extends PanelContainer

@onready var base_table: Button = $MarginContainer/VBoxContainer/BaseTable
@onready var oven: Button = $MarginContainer/VBoxContainer/Oven


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
	
func _on_oven_pressed() -> void:
	if InventoryManager.inventory["stone"] != null:
		if InventoryManager.inventory["stone"] >= 5:
			for i in range(5):
				InventoryManager.remove_collectable("stone")
		

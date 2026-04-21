extends PanelContainer

@onready var base_table: Button = $MarginContainer/VBoxContainer/BaseTable


func _process(delta: float) -> void:
	if InventoryManager.inventory["stone"] >= 5:
		base_table.disabled = false
	else:
		base_table.disabled = true

func _on_base_table_pressed() -> void:
	if InventoryManager.inventory["stone"] >= 5:
		for i in range(5):
			InventoryManager.remove_collectable("stone")
		

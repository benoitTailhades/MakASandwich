extends PanelContainer

@onready var sandwich_label: Label = $MarginContainer/VBoxContainer/Sandwiches/SandwichLabel


func _ready() -> void:
	InventoryManager.inventory_changed.connect(on_inventory_changed)


func on_inventory_changed():
	var inventory: Dictionary = InventoryManager.inventory
	
	if inventory.has("sandwich"):
		sandwich_label.text = str(inventory["sandwich"])

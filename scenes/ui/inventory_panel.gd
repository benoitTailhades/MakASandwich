extends PanelContainer

@onready var log_label: Label = $MarginContainer/VBoxContainer/Logs/LogLabel
@onready var stone_label: Label = $MarginContainer/VBoxContainer/Stone/StoneLabel
@onready var corn_label: Label = $MarginContainer/VBoxContainer/Corn/CornLabel
@onready var tomato_label: Label = $MarginContainer/VBoxContainer/Tomato/TomatoLabel
@onready var salad_label: Label = $MarginContainer/VBoxContainer/Salad/SaladLabel
@onready var chicken_label: Label = $MarginContainer/VBoxContainer/Chicken/ChickenLabel
@onready var bread_label: Label = $MarginContainer/VBoxContainer/Bread/BreadLabel

func _ready() -> void:
	InventoryManager.inventory_changed.connect(on_inventory_changed)

func on_inventory_changed():
	var inventory: Dictionary = InventoryManager.inventory
	
	if inventory.has("log"):
		log_label.text = str(inventory["log"])
		
	if inventory.has("stone"):
		stone_label.text = str(inventory["stone"])
		
	if inventory.has("corn"):
		corn_label.text = str(inventory["corn"])
		
	if inventory.has("tomato"):
		tomato_label.text = str(inventory["tomato"])
		
	if inventory.has("salad"):
		salad_label.text = str(inventory["salad"])
	
	if inventory.has("chicken"):
		chicken_label.text = str(inventory["chicken"])

	if inventory.has("bread"):
		bread_label.text = str(inventory["bread"])

class_name Player
extends CharacterBody2D

@onready var hit_component: HitComponent = $HitComponent

@export var current_tool: DataTypes.Tools = DataTypes.Tools.None

var player_direction : Vector2 

func _ready():
	add_to_group("player")
	InventoryManager.add_collectable("bread")
	InventoryManager.add_collectable("salad")
	InventoryManager.add_collectable("tomato")
	InventoryManager.add_collectable("chicken")
	ToolManager.tool_selected.connect(on_tool_selected)

func on_tool_selected(tool: DataTypes.Tools):
	current_tool = tool
	hit_component.current_tool = tool
	
func _process(delta: float) -> void:
	pass
	

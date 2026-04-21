extends Node

var inventory = Dictionary()

signal inventory_changed

func add_collectable(collectable_name: String):
	inventory.get_or_add(collectable_name)
	
	if inventory[collectable_name] == null:
		inventory[collectable_name] = 1
	else:
		inventory[collectable_name] += 1

	inventory_changed.emit()

func remove_collectable(collectable_name: String):
	inventory.get_or_add(collectable_name)
	if inventory[collectable_name] == null:
		pass
	elif inventory[collectable_name] == 0:
		pass
	else:
		inventory[collectable_name] -= 1
	
	inventory_changed.emit()

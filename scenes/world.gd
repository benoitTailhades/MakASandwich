extends Node2D

func _ready():
	var tilemap_layer = $layer1
	var player = $Player
	var cam = $Player/Camera2D

	var cell_size = tilemap_layer.tile_set.tile_size

	var l = -30 * cell_size.x
	var t = -61 * cell_size.y
	var r = 177 * cell_size.x
	var b = 20 * cell_size.y
	
	

	# Limites caméra
	cam.limit_left   = l
	cam.limit_top    = t
	cam.limit_right  = r
	cam.limit_bottom = b

	# Limites joueur
	player.limit_left   = l
	player.limit_right  = r
	player.limit_top    = t
	player.limit_bottom = b
	

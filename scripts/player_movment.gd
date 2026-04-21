class_name Player
extends CharacterBody2D


var player_direction : Vector2 
@export var inv: Inv

func collect(item):
	inv.insert(item)

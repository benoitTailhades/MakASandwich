extends CharacterBody2D


@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

var kfc_scene = preload("res://scenes/objects/meat/kfc.tscn")

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damaged_reached.connect(on_max_damaged_reached)

func on_hurt(hit_damage:int)-> void:
	damage_component.apply_damage(hit_damage)


func on_max_damaged_reached()->void:
	call_deferred("add_kfc_scene")
	print("Max damage reach")
	queue_free()


func add_kfc_scene() ->void:
	var kfc_instance = kfc_scene.instantiate() as Node2D
	kfc_instance.global_position = global_position
	get_parent().add_child(kfc_instance)

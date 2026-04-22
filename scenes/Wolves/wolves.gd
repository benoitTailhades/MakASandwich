extends CharacterBody2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent



func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damaged_reached.connect(on_max_damaged_reached)
	
func on_hurt(hit_damage:int)-> void:
	_flash_red()
	damage_component.apply_damage(hit_damage)
	
	

func _flash_red():
	var tween = create_tween()
	tween.tween_property(self,"modulate",Color(1,0,0,1),0.05)
	tween.tween_property(self,"modulate",Color(1,1,1,1),0.2)
	
func on_max_damaged_reached()->void:
	call_deferred("add_log_scene")
	print("Max damage reach")
	queue_free()
	

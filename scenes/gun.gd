extends Area2D

static var rangeScale := 1.0
@onready var collision_shape_2d = %CollisionShape2D


func _physics_process(_delta):
	var enemies = get_overlapping_bodies()
	if enemies.size() > 0:
		var target = enemies[0]
		look_at(target.global_position)
	
	
func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %BulletPoint.global_position
	new_bullet.global_rotation = %BulletPoint.global_rotation
	%BulletPoint.add_child(new_bullet)

func _on_timer_timeout():
	shoot()


func _on_player_press_range_pluse():
	collision_shape_2d.scale *= rangeScale

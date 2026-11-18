extends Node2D

#signal add_cash(value)
#var new_mob = preload("res://scenes/mob.tscn").instantiate()
#func _ready():
	#new_mob.mob_destroyed.connect(_on_mob_destroyed)
	#
signal new_game_request

func spawn_mob():
	var new_mob = preload("res://scenes/mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func _on_timer_timeout():
	spawn_mob()


func _on_player_healt_is_empty():
	%GameOver.visible = true
	$Timer.stop()
#	get_tree().paused = true




func _on_try_again_pressed():
	new_game_request.emit()
	%GameOver.visible = false
	
	


func _on_new_game_request():
	get_tree().reload_current_scene()

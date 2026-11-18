extends CharacterBody2D

signal press_range_pluse
signal healt_is_empty

static var maxHealth := 100.0
static var health := 100.0

var posVector


func _ready():
	pass

func _physics_process(delta):
	#var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	#velocity = direction * 500
	var direction = posVector
	if direction:
		velocity = direction * 500
	else:
		velocity = Vector2(0,0)
	move_and_slide()
	
	if velocity.length() > 0.0:
		$Pinky.play_walk_animation()
	else:
		$Pinky.play_idle_animation()
	
	const DAMAGE_RATE = 10.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= overlapping_mobs.size() * DAMAGE_RATE * delta
		%ProgressBar.value = health
		if health <= 0.0:
			healt_is_empty.emit()
			queue_free()


func _on_control_pos_vector(vector):
	posVector = vector


func _on_control_range_plus_press():
	press_range_pluse.emit()


func _on_control_health_plus_press():
	%ProgressBar.max_value = maxHealth
	%ProgressBar.size.x *= 1.2


func _on_control_full_health_press():
	%ProgressBar.value = health
	

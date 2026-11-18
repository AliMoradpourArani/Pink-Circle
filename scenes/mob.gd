extends CharacterBody2D

static var cash := 0.0
static var cash_value := 1.0
var health = 300


@onready var player = get_node("/root/Game/Player")

func _ready():
	%Jelly.play_walk_animation()
	
func _physics_process(_delta):
	if player != null :
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * 250.0
	move_and_slide()
	
	#if velocity.length() <= 0.0:
		#%Jelly.play_idle_animation()
		
func take_damage(damage):
	if health <= 0:
		const EXPLOSION_SMOKE = preload("res://objects/smoke/explosion.tscn")
		var smoke = EXPLOSION_SMOKE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		cash += (3 * cash_value)
		queue_free()
		
	else:
		health -= damage
		%Jelly.play_hurt_animation()
		

extends Area2D

var distanse = 0
static var damageRate = 1.0

func _physics_process(delta):
	const SPEED = 2000
	const RANGE = 700
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * 2000 * delta
	
	distanse += SPEED * delta
	
	if distanse >= RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free()
	
	if body.has_method("take_damage"):
		body.take_damage(70 * damageRate)

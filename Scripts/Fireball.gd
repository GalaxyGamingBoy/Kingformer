extends Area2D

const SPEED = 150
var velocity = Vector2()
var direction = 1



func set_fireball_direction(dir):
	direction = dir
	if dir == -1:
		$Sprite.flip_h = true

func _physics_process(delta):
	
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$Sprite.play("Default")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Fireball_body_entered(body):
	if body.is_in_group("Enemy"):
		body.dead()
	queue_free()

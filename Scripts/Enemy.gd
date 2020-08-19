extends KinematicBody2D

const GRAVITY = 20
const FLOOR = Vector2(0, -1)

export(int) var speed = 100
var motion = Vector2()
var direction = 1

func _ready():
	pass

func _physics_process(delta):
	motion.x = speed * direction
	motion.y += GRAVITY
	motion = move_and_slide(motion, FLOOR) 
	$Sprite.play("Run")
	if(direction == 1):
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true
	
	
	
	
	
	
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1
	
	
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				get_slide_collision(i).collider.dead()
	
	
	
	

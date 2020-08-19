extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
onready var sprite_path = get_node("Sprite")
export(int)var max_speed = 300
export(int)var jump_power = -550
export(int)var gravity = 20
export(int)var acceleration = 50
export(bool)var not_dead
export(String, FILE, "*.tscn") var current_level
func _ready():
	not_dead = true
func _physics_process(delta):
	motion.y += gravity
	if not_dead:
		#Go down
		#Detect Action
		if Input.is_action_pressed("ui_right"):
			motion.x = min(motion.x+acceleration, max_speed)
			sprite_path.flip_h = false
			sprite_path.play("Run")
		elif Input.is_action_pressed("ui_left"):
			motion.x -= acceleration 
			motion.x = max(motion.x-acceleration, -max_speed)
			sprite_path.flip_h = true
			sprite_path.play("Run")
		else:
			motion.x = 0
			sprite_path.play("Idle")
		
		
		
		
		
		
		if is_on_floor():
			#Jump
			if Input.is_action_pressed("ui_up"):
				motion.y = jump_power
				sprite_path.play("Jump")
				
		motion = move_and_slide(motion, UP)
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Enemy" in get_slide_collision(i).collider.name:
					dead()

func dead():
	not_dead = false
	$Sprite.play("Dead")
	$CollisionShape2D.disabled = true
	$Timer.start()
func _on_CoinA_body_entered(body):
	pass # Replace with function body.


func _on_Timer_timeout():
	print("Respawning to: ", current_level)
	get_tree().change_scene(current_level)

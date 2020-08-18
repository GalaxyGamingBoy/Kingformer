extends Area2D

export(String, FILE, "*.tscn") var next_level
export(bool)var coin
export(bool)var no_coins

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.get_name() == "Player":
			if no_coins:
				print("Switching to: ", next_level)
				get_tree().change_scene(next_level)
			else:
				if coin:
					print("Switching to: ", next_level)
					get_tree().change_scene(next_level)
				else:
					print("No coin Gathered")
			pass
		pass
	
	


func _on_Coin_body_entered(body):
	coin = true
	print("Coin gathered")
	

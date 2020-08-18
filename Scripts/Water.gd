extends Area2D

export(String, FILE, "*.tscn") var current_level

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.get_name() == "Player":
			print("Respawning to: ", current_level)
			get_tree().change_scene(current_level)
		pass
	
	

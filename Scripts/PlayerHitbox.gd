extends Area2D

export(String) var Player = "/root"
onready var player_location = get_node(Player)

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		print(body.get_name())
		if body.get_name() == "Enemy":
			player_location.queue_free()

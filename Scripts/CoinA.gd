extends Control

onready var no = get_node("HBoxContainer/CheckNo")
onready var yes = get_node("HBoxContainer/CheckYes")

func _ready():
	no.show()
	yes.hide()
	


func _on_CoinA_body_entered(body):
	yes.show()
	no.hide()

extends Control

onready var no = get_node("CoinA/CheckNo")
onready var yes = get_node("CoinA/CheckYes")

func _ready():
	no.show()
	yes.hide()
	


func _on_Coin_body_entered(body):
	


func _on_Coin2_body_entered(body):
	yes.show()
	no.hide()

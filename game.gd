extends Node2D
@onready var rotuloCurrency = $RotuloCurrency

func _on_botao_inicial_pressed() -> void:
	Global.executarClique()
	rotuloCurrency.text = "Currency: %d" % [Global.currency]

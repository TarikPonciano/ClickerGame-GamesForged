extends Node2D

@onready var rotuloCurrency = $RotuloCurrency


func _on_botao_inicial_pressed() -> void:
	Global.executarClique()
	rotuloCurrency.text = "Currency: %d" % [Global.currency]
	
	# Lógica de feedback de click
	
	#Altera o elemento quando é clicado
	#$BotaoInicial.color = Color(1.0, 0.0, 0.0, 1.0)
	
	#Código para esperar um tempo específico em segundos
	#await get_tree().create_timer(0.2).timeout
	
	#Retorna o elemento para o original
	#$BotaoInicial.color = Color(0.0, 0.0, 1.0, 1.0)
	

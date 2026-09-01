extends Node2D

@onready var rotuloCurrency = $RotuloCurrency
@onready var cardUpgClick = $PainelShop/CardUpgClick

#func _ready() -> void:
	#$PainelUpgrades/Upgrade1.pressed.connect(_on_comprar_upgrade_pressed.bind($PainelUpgrades/Upgrade1))
	#


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
	


func _on_comprar_upg_click_pressed() -> void:
	Global.comprar_upg_click()
	rotuloCurrency.text = "Currency: %d" % [Global.currency]
	$PainelShop/CardUpgClick/Button.text = "Comprar - $ %d" % [Global.upg_click_custo]


func _on_comprar_gerador_1_pressed() -> void:
	# Etapa Back (Global)
	Global.comprar_gerador_1()
	# Etapa Front
	rotuloCurrency.text = "Currency: %d" % [Global.currency]
	$PainelShop/CardGerador1/Button.text = "Comprar - $ %d" % [Global.upg_gerador_1_custo]


func _on_ativador_ganho_passivo_timeout() -> void:
	Global.calcular_ganho_passivo()
	rotuloCurrency.text = "Currency: %d" % [Global.currency]
	
	var tempo_espera = 1
	
	if Global.upgrade_2_comprado == true:
		tempo_espera /= 2
		
	$AtivadorGanhoPassivo.wait_time = tempo_espera
	


func _on_comprar_upgrade_pressed(source: BaseButton) -> void:
	
	if source.name == "Upgrade1":
		# Compra o upgrade no back
		Global.comprar_upgrade("Upgrade1")
		if Global.upgrade_1_comprado == true:
			source.add_theme_stylebox_override("normal", preload("res://estilo_botao_comprado.tres"))
		
	elif source.name == "Upgrade2":
		Global.comprar_upgrade("Upgrade2")

	rotuloCurrency.text = "Currency: %d" % [Global.currency]

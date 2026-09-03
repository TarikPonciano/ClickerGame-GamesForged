extends Node

var currency = 0
var ganho_passivo = 0

#Upgrade Click

var upg_click_nivel = 1
var upg_click_custo = 10

# Upgrade Gerador 1

#var upg_gerador_1_nome = "Mouse Básico"
var upg_gerador_1_nivel = 0
var upg_gerador_1_poder = 1
var upg_gerador_1_custo = 50

# Variáveis do Upgrade 1

var upgrade_1_comprado = false
var upgrade_1_custo = 200

# Variáveis do Upgrade 2

var upgrade_2_comprado = false
var upgrade_2_custo = 500

# Variáveis da Ascenção

var nivel_ascencao = 0
var custo_ascencao = 10000

func executarClique():
	var aumento = 1
	
	aumento *= upg_click_nivel
	
	if upgrade_1_comprado:
		aumento *= 2
	
	currency += aumento * (2**nivel_ascencao)
	
func comprar_upg_click():
	if currency >= upg_click_custo:
		
		currency -= upg_click_custo
		
		upg_click_nivel += 1
		
		upg_click_custo = 10 * (upg_click_nivel ** 2)

func comprar_gerador_1():
	if currency >= upg_gerador_1_custo:
		
		currency -= upg_gerador_1_custo
		
		upg_gerador_1_nivel += 1
		
		upg_gerador_1_custo *= 1.1
		
func calcular_ganho_passivo():
	ganho_passivo = (upg_gerador_1_nivel * upg_gerador_1_poder)
	currency += ganho_passivo * (2**nivel_ascencao)
	
func comprar_upgrade(upgrade_escolhido):
	if upgrade_escolhido == "Upgrade1":
		if currency >= upgrade_1_custo and upgrade_1_comprado == false:
			currency -= upgrade_1_custo
			upgrade_1_comprado = true
	elif upgrade_escolhido == "Upgrade2":
		if currency >= upgrade_2_custo and upgrade_2_comprado == false:
			currency -= upgrade_2_custo
			upgrade_2_comprado = true
			

func ascender():
	if currency >= custo_ascencao:
		currency -= custo_ascencao
		nivel_ascencao += 1
		custo_ascencao = 10000 * (10 ** nivel_ascencao)
		
		currency = 0
		ganho_passivo = 0
		upg_click_nivel = 1
		upg_click_custo = 10
		upg_gerador_1_nivel = 0
		upg_gerador_1_poder = 1
		upg_gerador_1_custo = 50
		upgrade_1_comprado = false
		upgrade_1_custo = 200
		upgrade_2_comprado = false
		upgrade_2_custo = 500

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

func executarClique():
	currency += 1 * upg_click_nivel
	
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
	currency += ganho_passivo
	

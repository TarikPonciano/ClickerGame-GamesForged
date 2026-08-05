extends Node


var currency = 0

#Upgrade Click

var upg_click_nivel = 1
var upg_click_custo = 10


func executarClique():
	currency += 1 * upg_click_nivel
	
func comprar_upg_click():
	if currency >= upg_click_custo:
		
		currency -= upg_click_custo
		
		upg_click_nivel += 1
		
		upg_click_custo = 10 * (upg_click_nivel ** 2)

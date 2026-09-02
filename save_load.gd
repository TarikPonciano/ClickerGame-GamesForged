extends Node

const SAVE_PATH = "user://saveclicker.json"
const LS_KEY = "savegame"

func salvar_jogo():
	var dados_jogo = {
		"currency": Global.currency,
		"ganho_passivo": Global.ganho_passivo,
		"upg_click_nivel": Global.upg_click_nivel,
		"upg_click_custo": Global.upg_click_custo, 
		"upg_gerador_1_nivel": Global.upg_gerador_1_nivel,
		"upg_gerador_1_poder": Global.upg_gerador_1_poder,
		"upg_gerador_1_custo": Global.upg_gerador_1_custo,
		"upgrade_1_comprado": Global.upgrade_1_comprado,
		"upgrade_2_comprado":  Global.upgrade_2_comprado
	} 
	var json_dados = JSON.stringify(dados_jogo)
	
	if OS.has_feature("web"):
		var comando_js = "localStorage.setItem('%s', %s);" % [LS_KEY, json_dados]
		JavaScriptBridge.eval(comando_js)
	else:
		pass
	
	

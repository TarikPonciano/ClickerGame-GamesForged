extends Node

const SAVE_PATH = "user://saveclicker.json"
const LS_KEY = "savegame"

func salvar_jogo():
	# AQUI VOCÊ MODIFICA COM SEUS DADOS
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
		var arquivo = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
		
		if arquivo == null:
			print("ERRO AO SALVAR ARQUIVO!")
			return
		
		arquivo.store_string(json_dados)
		arquivo.close()
			
	
func carregar_jogo():
	
	var dados_carregados = ""
	
	if OS.has_feature("web"):
		var resultado  = JavaScriptBridge.eval("localStorage.getItem('%s');" % LS_KEY, true)
		
		if resultado == null: 
			print("SAVE NÃO ENCONTRADO")
			return
			
		dados_carregados = resultado
	else:
		if not FileAccess.file_exists(SAVE_PATH):
			print("SAVE NÃO ENCONTRADO")
			return
		var arquivo = FileAccess.open(SAVE_PATH, FileAccess.READ)
		if arquivo == null:
			print("ERRO NO ARQUIVO DE SAVE")
			return
		dados_carregados = arquivo.get_as_text()
		arquivo.close()
	
	var dados_json = JSON.new()
	if dados_json.parse(dados_carregados) != OK:
		print("ERRO AO CONVERTER SAVE")
		return
	var dados_prontos = dados_json.data
	print(dados_prontos)
	
	# AQUI VOCÊ MODIFICA COM SEUS DADOS
	
	Global.currency = dados_prontos["currency"]
	Global.upg_gerador_1_custo = dados_prontos["upg_gerador_1_custo"]
	Global.upg_gerador_1_nivel = dados_prontos["upg_gerador_1_nivel"]
	Global.upg_gerador_1_poder = dados_prontos["upg_gerador_1_poder"]
	#Global.ganho_passivo = dados_json["ganho_passivo"]
		
		
	

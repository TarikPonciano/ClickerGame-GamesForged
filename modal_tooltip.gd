extends Panel

#var informacoes_visuais = {
	#"Upgrade1": ["Patos Fofos", "A fofura dos patos, faz com que você clique mais motivado!", 100]
#}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	
func _on_elemento_visual_mouse_entered(source: Control) -> void:
	self.visible = true
	
	# Colocar o modal na posição do mouse
	#self.position = get_global_mouse_position() - Vector2(0,200)
	
	if source.name == "Upgrade1":
		$Titulo.text = "RGB no Computador"
		$Descricao.text = "As luzes piscantes lhe motivam para clicar mais rápido e precisamente! Multiplica os ganhos de click em 2x"
		$Preco.text = "$ 200.00"
		
		if Global.currency >= Global.upgrade_1_custo or Global.upgrade_1_comprado:
			source.add_theme_stylebox_override("pressed", preload("res://estilo_botao_comprado.tres"))
		else:
			source.add_theme_stylebox_override("pressed", preload("res://estilo_botao_negado.tres"))
		
		
	elif source.name == "Upgrade2":
		$Titulo.text	 = "Teclado Mecânico da Hello Kitty"
		$Descricao.text = "O suave barulho das teclas fazem com que você possa clicar por mais tempo sem precisar de repouso! Reduz o tempo de espera dos geradores pela metade!"
		$Preco.text = "$ 500.00"
	else:
		self.visible = false
	#$Titulo.text = informacoes_visuais[source.name][0]
	#$Descricao.text = informacoes_visuais[source.name][1]
	#$Preco.text = str(informacoes_visuais[source.name][2])


func _on_elemento_visual_mouse_exited() -> void:
	self.visible = false

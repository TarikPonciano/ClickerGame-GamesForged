extends Panel

#var informacoes_visuais = {
	#"Upgrade1": ["Patos Fofos", "A fofura dos patos, faz com que você clique mais motivado!", 100]
#}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	


func _on_elemento_visual_mouse_entered(source: Control) -> void:
	self.visible = true
	
	if source.name == "Upgrade1":
		$Titulo.text	 = "RGB no Computador"
		$Descricao.text = "As luzes piscantes lhe motivam para clicar mais rápido e precisamente!"
		$Preco.text = "$ 200.00"
	elif source.name == "Upgrade2":
		$Titulo.text	 = "Teclado Mecânico da Hello Kitty"
		$Descricao.text = "O suave barulho das teclas fazem com que você possa clicar por mais tempo sem precisar de repouso!"
		$Preco.text = "$ 500.00"
	else:
		self.visible = false
	#$Titulo.text = informacoes_visuais[source.name][0]
	#$Descricao.text = informacoes_visuais[source.name][1]
	#$Preco.text = str(informacoes_visuais[source.name][2])


func _on_elemento_visual_mouse_exited() -> void:
	self.visible = false

extends Button


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = '''$%d
	Para Ascender''' % Global.custo_ascencao
	
	if Global.currency >= Global.custo_ascencao:
		disabled = false
	else:
		disabled = true

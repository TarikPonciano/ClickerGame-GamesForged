extends Panel


@onready var titulo = $Titulo
@onready var preco = $"Preço"
@onready var descricao = $"Descrição"

func _ready() -> void:
	visible = false


func _on_upgrade_mouse_dentro(source: Control) -> void:
	visible = true

extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	


func _on_elemento_visual_mouse_entered(source: Control) -> void:
	self.visible = true
	print(source.name)

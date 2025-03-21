extends Panel
@export var panel_color: Color


func _ready() -> void:
	get_theme_stylebox("panel").set_bg_color(panel_color)

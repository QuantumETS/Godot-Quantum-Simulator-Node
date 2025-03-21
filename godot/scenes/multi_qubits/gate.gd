extends Panel
@export var panel_color: Color


func _ready() -> void:
	get_theme_stylebox("panel").set_bg_color(panel_color)

func change_z_index():
	z_index = 1
	$RichTextLabel.z_index = 1

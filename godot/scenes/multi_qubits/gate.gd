extends Panel
@export var panel_color: Color

func _ready() -> void:
	get_theme_stylebox("panel").set_bg_color(panel_color)

func change_z_index():
	z_index = 1
	$gate_name.z_index = 1

func set_gate_type(type:String):
	$gate_name.text = type

func get_gate_type():
	return $gate_name.text

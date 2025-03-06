extends Panel
@export_enum("X", "Y", "Z", "H", "S", "T","RX(%0.2f)","RY(%0.2f)","RZ(%0.2f)","SWAP","CNOT","custom_controlled") var gate_name: String
@export var panel_color: Color
#@export var texture : Texture
#@export var mesh : Mesh

@onready var gate = preload("res://scenes/multi_qubits/gate.tscn")

func _on_gui_input(event: InputEvent) -> void:
	var temp = gate.instantiate()

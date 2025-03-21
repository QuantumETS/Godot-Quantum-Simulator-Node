extends Panel
@export_enum("X", "Y", "Z", "H", "S", "T","RX(%0.2f)","RY(%0.2f)","RZ(%0.2f)","SWAP","CNOT","custom_controlled") var gate_name: String
@export var panel_color: Color
#@export var texture : Texture
#@export var mesh : Mesh

@onready var gate = preload("res://scenes/multi_qubits/gate.tscn")

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 1:
		var temp = gate.instantiate()
		add_child(temp)
		# put the spawner theme onto the temp gate
		temp.add_theme_stylebox_override("panel", get_theme_stylebox("panel"))
		
		temp.global_position = event.global_position-temp.get_rect().size/2
		temp.process_mode = Node.PROCESS_MODE_DISABLED
	if event is InputEventMouseMotion and event.button_mask == 1:
		var moving_gate = get_child(1)
		moving_gate.global_position = event.global_position-moving_gate.get_rect().size/2
	if event is InputEventMouseButton and event.button_mask == 0:
		get_child(1).queue_free()
	

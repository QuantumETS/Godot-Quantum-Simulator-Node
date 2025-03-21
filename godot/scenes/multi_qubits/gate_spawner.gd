extends Panel
@export_enum("X", "Y", "Z", "H", "S", "T","RX(%0.2f)","RY(%0.2f)","RZ(%0.2f)","SWAP","CNOT","custom_controlled") var gate_name: String
@export var panel_color: Color
#@export var texture : Texture
#@export var mesh : Mesh

@onready var gate = preload("res://scenes/multi_qubits/gate.tscn")

func find_closest_wire(pos: Vector2) -> Node:
	var closest = null
	var current_lowest_dist = 99999
	for wire in get_tree().get_nodes_in_group("wires"):
		var current_dist = abs(pos.y - wire.global_position.y)
		if current_dist < current_lowest_dist:
			current_lowest_dist = current_dist
			closest = wire
	return closest

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
		var moving_gate = get_child(1)
		var wire = find_closest_wire(event.global_position)
		if wire:
			remove_child(moving_gate)
			moving_gate.change_z_index()
			wire.attach_gate(moving_gate, event.global_position)
		else:
			moving_gate.queue_free()

extends Node

@export var MAX_QUBIT = 5
@onready var wire = preload("res://scenes/multi_qubits/wire.tscn")

func _on_add_wire_pressed() -> void:
	if $Control/wires/MarginContainer/VBox_wireholder.get_child_count() < MAX_QUBIT:
		var wire = wire.instantiate()
		$Control/wires/MarginContainer/VBox_wireholder.add_child(wire)

func _on_remove_wire_pressed() -> void:
	var nb_child = $Control/wires/MarginContainer/VBox_wireholder.get_child_count()
	if nb_child > 0:
		var remove = $Control/wires/MarginContainer/VBox_wireholder.get_child(nb_child-1)
		$Control/wires/MarginContainer/VBox_wireholder.remove_child(remove)

func get_wires_gates():
	var wires = $Control/wires/MarginContainer/VBox_wireholder.get_children()
	var gates_array = []
	gates_array.resize(wires.size())
	var index = 0
	for wire in wires:
		var to_append = []
		for gate in $Control/wires/MarginContainer/VBox_wireholder/wire/gates.get_children():
			to_append.append(gate.get_gate_type())
		gates_array[index] = to_append.duplicate()
		to_append.clear()
		index += 1
	print(gates_array)
	return gates_array

func _on_measure_pressed() -> void:
	var circuit = get_wires_gates()
	$QuantumCircuit.set_measure_circuit_and_set_bloch(circuit)

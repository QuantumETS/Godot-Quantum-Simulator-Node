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

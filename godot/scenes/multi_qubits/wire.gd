extends Control

var attached_gates := []
func _ready():
	add_to_group("wires")

func attach_gate(gate: Panel, position: Vector2):
	# Snap to wire's Y level
	gate.position.y = self.position.y
	# Optional: Snap to grid in X
	gate.position.x = round(position.x / 40.0) * 40.0
	add_child(gate)
	attached_gates.append(gate)

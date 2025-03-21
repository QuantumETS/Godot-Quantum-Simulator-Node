extends Control

func _ready():
	add_to_group("wires")

func attach_gate(gate: Panel, position: Vector2):
	# Snap to wire's Y level
	gate.position.y = self.position.y
	# Optional: Snap to grid in X
	gate.position.x = round(position.x / 40.0) * 40.0
	$gates.add_child(gate)

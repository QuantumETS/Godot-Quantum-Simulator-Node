extends Control
var bloch = load("res://scenes/bloch_scenes/main_scene.tscn")
var multi = load("res://scenes/menu_principale/principale.tscn")

func _on_bloch_sphere_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/bloch_scenes/main_scene.tscn")

func _on_multi_qubits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/multi_qubits/multi_qubits.tscn")

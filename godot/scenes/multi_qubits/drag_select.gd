extends Control
var dragging = false  # Are we currently dragging?
var selected = []  # Array of selected units.
var drag_start = Vector2.ZERO  # Location where drag began.
var select_rect = RectangleShape2D.new()  # Collision shape for drag box.
var first_click_position = Vector2()

func _process(delta):
	if Input.is_action_just_pressed("click"):
		first_click_position = get_global_mouse_position()

	if Input.is_action_pressed("click"):
		# We only want to start a drag if there's no selection.
		if selected.size() == 0:
			dragging = true
			drag_start = first_click_position
	elif dragging:
		# Button released while dragging.
		dragging = false
		queue_redraw()
	if dragging:
		queue_redraw()

func _draw():
	if dragging:
		draw_rect(Rect2(drag_start, get_global_mouse_position() - drag_start),
				Color(.5, .5, .5,0.5), true)

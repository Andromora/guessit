extends Area2D

signal pressed_keyboard_button(id)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_pressed_button(get_child(shape_idx),shape_idx)
		
func _pressed_button(letter_node,collision_node):
	#letter_node.play()
	#$type_sound.play()
	#print(letter_node)
	print(collision_node+1)
	#get_child(collision_node+26).disabled = true
	#pressed_buton_count =+ 1
	emit_signal("pressed_keyboard_button",collision_node+1)
	#emit_signal("letter_pressed",1)

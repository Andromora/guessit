extends Node2D

signal ready_button()

@onready var text_box = $textBox
@onready var keyboard = $Keyboard
@onready var not_allow = $NotAllow
func _ready():
	not_allow.visible = true
	text_box.text = ''
	keyboard.connect("pressed_keyboard_button", Callable(self, '_number_pressed'))

func _number_pressed(id):
	
	var current_text = text_box.text
	if(current_text.length() <= 4 && id <= 10):
		if(id == 10):
			text_box.text += "0"
			print(current_text.length())
		else:
			text_box.text += str(id)
			print(current_text.length())
	if(current_text.length() >=4):
		not_allow.visible = false
	else:
		not_allow.visible = true
	if(id == 12):
		text_box.text = current_text.substr(0,(current_text.length()-1))
	if(current_text.length() >= 4 && id == 11):
		print("you pressed ready")
		print(id)	
		print(current_text.length())
		not_allow.visible = false
		emit_signal("ready_button")
		

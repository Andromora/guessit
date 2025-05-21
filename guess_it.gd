extends Node2D

signal guessed_digits(digits)

@onready var text_box = $L_guessed_number
@onready var keyboard = $Keyboard
@onready var not_allow = $NotAllow
@onready var conc_results = $RT_concatenated_results

var current_text
var old_digits = []
var old_results = []

func _ready():
	text_box.text = ""
	conc_results.text = ""
	not_allow.visible = true
	keyboard.connect("pressed_keyboard_button", Callable(self, '_number_pressed'))

func _number_pressed(id):
	
	current_text = text_box.text
	#print("first measure" + str(current_text.length()))
	if(current_text.length() <= 4 && id <= 10):
		if(id == 10):
			text_box.text += "0"
			current_text = text_box.text
			#print(current_text.length())
		else:
			text_box.text += str(id)
			current_text = text_box.text
			#print(current_text.length())
	if(id == 12):
		text_box.text = current_text.substr(0,(current_text.length()-1))
		current_text = text_box.text
	if(current_text.length() >=5):
		not_allow.visible = false
	else:
		not_allow.visible = true
	if(current_text.length() >= 5 && id == 11):
		#print("you pressed ready")
		#print(id)	
		#print(current_text.length())
		not_allow.visible = false
		emit_signal("guessed_digits", current_text)
		old_digits.append(text_box.text)
		old_results.append(3)
		_fill_the_results()
		text_box.text = ""
		current_text = text_box.text
		not_allow.visible = true

func _fill_the_results():
	conc_results.text = ""
	for i in range(old_digits.size()):
		
		conc_results.text = conc_results.text + str(old_digits[i]) + "      " + str(old_results[i]) +"\n"

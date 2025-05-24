extends Node2D

signal guessed_digits(digits)

@onready var text_box = $L_guessed_number
@onready var keyboard = $Keyboard
@onready var not_allow = $NotAllow
@onready var conc_results = $RT_concatenated_results

var current_text
var old_digits = []
var old_results = []
var rand_number = randi_range(10000, 99999)

func _ready():
	text_box.text = ""
	conc_results.text = ""
	not_allow.visible = true
	keyboard.connect("pressed_keyboard_button", Callable(self, '_number_pressed'))
	print(rand_number)

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
		_compare_numbers(current_text, str(rand_number))
		not_allow.visible = false
		emit_signal("guessed_digits", current_text)
		GameManager._set_the_number(int(current_text))
		old_digits.append(text_box.text)
		_fill_the_results()
		text_box.text = ""
		current_text = text_box.text
		not_allow.visible = true

func _fill_the_results():
	conc_results.text = ""
	for i in range(old_digits.size()):
		conc_results.text = conc_results.text + str(old_digits[i]) + "      " + str(old_results[i]) +"\n"

func _compare_numbers(digited_number: String, other_player_number: String):
	var matched_digits = 0
	for i in (digited_number.length()):
		
		print(digited_number.substr(i,1))
		print(other_player_number.substr(i,1))
		print("-------")
		if(digited_number.substr(i,1) == other_player_number.substr(i,1)):
			matched_digits = matched_digits + 1
	old_results.append(matched_digits)
	if (matched_digits == 5):
		text_box.text = "VICTORY"

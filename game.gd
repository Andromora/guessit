extends Node2D

@onready var your_number = $YourNumber
@onready var guess_it = $Guess_it

var rand_number = randi_range(10000, 99999) #is tempral here, because not defined just yet.

func _ready():
	your_number.visible = true
	guess_it.visible = false
	#print(rand_number)
	your_number.connect("ready_button", Callable(self, '_number_selected'))
	guess_it.connect("guessed_digits", Callable(self, '_number_digited'))

func _number_selected(digited_number):
	your_number.visible = false
	guess_it.visible = true
	print(digited_number)

func _number_digited(number):
	if(rand_number == int(number)):
		print("got it")

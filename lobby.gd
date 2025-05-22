extends Control

@onready var challenge_button = $ChallengeButton
@onready var users_container = $ScrollContainer/UsersContainer

func _ready() -> void:
	challenge_button.pressed.connect(_on_pressed_button)
	
	for n in 100:
		var label = Label.new()
		label.text = "User %s" % n
		users_container.add_child(label)
	
func _on_pressed_button():
	SceneManager.got_to_scene(SceneManager.GAME_SCENE)

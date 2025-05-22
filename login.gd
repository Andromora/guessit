extends Control

@onready var login_button = $LogInButton
@onready var username_input = $UsernameInput
@onready var error_label = $ErrorLabel

func _ready() -> void:
	GameManager.login_failed.connect(_on_login_failed)
	GameManager.login_succeed.connect(_on_login_succeed)
	login_button.pressed.connect(_on_pressed_login_button)

func _on_pressed_login_button():
	var username = username_input.text
	
	if _is_valid_username(username):
		GameManager.loginUser(username)
	
func _is_valid_username(username: String) -> bool:
	if username.strip_edges().length() == 0:
		_print_error("username cannot be empty")
		return false

	return true
	
func _on_login_failed(error: String):
	printerr(error)
	_print_error(error)
	
func _on_login_succeed():
	SceneManager.got_to_scene(SceneManager.LOBBY_SCENE)
	
func _print_error(error: String):
	error_label.text = error
	error_label.visible = true

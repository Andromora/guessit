extends Node

signal login_failed(error: String)
signal login_succeed
signal typed_number(digit)

var number_to_guess: int
var number_entered: int
var userID: String
var username: String

func loginUser(username: String):
	var query =  SupabaseQuery.new().from("players").insert([{ "username": username }])
	var query_task = Supabase.database.query(query)
	await query_task.completed
	
	if query_task.error != null:
		login_failed.emit(str(query_task.error))
	else:
		login_succeed.emit()
	
func _set_the_number(digit: int):
	number_entered = digit
	emit_signal("typed_number",digit)

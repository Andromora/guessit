extends Node

const LOG_IN_SCENE = preload("res://login.tscn")
const LOBBY_SCENE = preload("res://lobby.tscn")
const GAME_SCENE = preload("res://game.tscn")

func got_to_scene(scene):
	get_tree().change_scene_to_packed(scene)

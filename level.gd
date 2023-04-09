extends Node

var globalVariables

func _ready():
	globalVariables = get_node("/root/GlobalVariables")

func _reset_ball():
	$Ball.position = Vector2(576, 324)
	$Ball.speedX = $Ball.DefaultSpeed
	$Ball.speedY = 10
	$Ball._new_dir_y()

func _player_two_won():
	$IU._ptwo_won()
	globalVariables.gameStarted = false
	$Ball.hide()
	get_tree().call_group("Players", "_reset_players")
	
func _player_one_won():
	$IU._pone_won()
	globalVariables.gameStarted = false
	$Ball.hide()
	get_tree().call_group("Players", "_reset_players")
	
func _on_iu_start():
	globalVariables.gameStarted = true
	$Ball.show()
	_reset_ball()

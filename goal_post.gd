extends Area2D

var globalVariable
var level
@export var psPost = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	globalVariable = get_node("/root/GlobalVariables")
	level = get_parent()

func _on_area_entered(_area):
	if globalVariable.playerTwoScore < 4 && globalVariable.playerOneScore < 4:
		if psPost == 0:
			globalVariable.playerTwoScore += 1
		else:
			globalVariable.playerOneScore += 1
		level._reset_ball()
	elif globalVariable.playerTwoScore == 4:
		globalVariable.playerTwoScore += 1
		level._player_two_won()
	elif globalVariable.playerOneScore == 4:
		globalVariable.playerOneScore += 1
		level._player_one_won()

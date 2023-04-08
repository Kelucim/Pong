extends Node

var upDown = 0
var playerBounced = 0
var playerOneScore = 0
var playerTwoScore = 0
var gameStarted = false

func _ready():
	Engine.max_fps = 60

extends CanvasLayer


var playerScores

signal start

# Called when the node enters the scene tree for the first time.
func _ready():
	playerScores = get_node("/root/GlobalVariables")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$PlayerOneScoreLabel.text = str(playerScores.playerOneScore)
	$PlayerTwoScoreLabel.text = str(playerScores.playerTwoScore)

func _reset_menu():
	$Button.show()
	$PlayerOneScoreLabel.hide()
	$PlayerTwoScoreLabel.hide()
	playerScores.playerOneScore = 0
	playerScores.playerTwoScore = 0
	$Title.text = "Pong!"

func _on_button_pressed():
	$Button.hide()
	$Title.hide()
	$PlayerOneScoreLabel.show()
	$PlayerTwoScoreLabel.show()
	start.emit()
	
func _pone_won():
	$Title.show()
	$Title.text = "Player One Wins!"
	$Timer.start()
	await $Timer.timeout
	$Timer.stop()
	_reset_menu()
	
func _ptwo_won():
	$Title.show()
	$Title.text = "Player Two Wins!"
	$Timer.start()
	await $Timer.timeout
	$Timer.stop()
	_reset_menu()

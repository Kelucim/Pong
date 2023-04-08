extends CharacterBody2D

@export var player = 0
var player_speed = 15
var sendInfo

# Called when the node enters the scene tree for the first time.
func _ready():
	sendInfo = get_node("/root/GlobalVariables")

	if player == 0:
		position.x = 32
	else:
		position.x = 1120
		
	position.y = 324

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	move_and_collide(Vector2(0, 0))
	if player == 0 && sendInfo.gameStarted:
		_p0_movement()
	elif player == 1 && sendInfo.gameStarted:
		_p1_movement()
	
func _p0_movement():
	if Input.is_action_pressed("p0_down") && position.y < 600:
		move_and_collide(Vector2(0, player_speed))
		if sendInfo.playerBounced != player:
			sendInfo.upDown = 1

	if Input.is_action_pressed("p0_up") && position.y > 48:
		move_and_collide(Vector2(0, -player_speed))
		if sendInfo.playerBounced != player:
			sendInfo.upDown = -1

func _p1_movement():
	if Input.is_action_pressed("p1_down") && position.y < 600:
		move_and_collide(Vector2(0, player_speed))
		if sendInfo.playerBounced != player:
			sendInfo.upDown = 1

	if Input.is_action_pressed("p1_up") && position.y > 48:
		move_and_collide(Vector2(0, -player_speed))
		if sendInfo.playerBounced != player:
			sendInfo.upDown = -1

func _reset_players():
	position.y = 324

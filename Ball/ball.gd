extends CharacterBody2D

var dirX
var DefaultSpeed = 8
var speedX
var dirY = 0
var speedY = 10
var whichDir
var maxSpeedY = 20
@export var maxSpeed = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	whichDir = get_node("/root/GlobalVariables")
	
	position = Vector2(576, 324)
	dirX = randi_range(0,1)
	if dirX == 1:
		dirX = 1
		whichDir.playerBounced = 0
	else:
		dirX = -1
		whichDir.playerBounced = 1
	
	
	speedX = DefaultSpeed
	speedY = 1
	
	hide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if whichDir.gameStarted:
		move_and_collide(Vector2(1 * dirX * speedX, dirY * speedY))
	
	if position.y <= 8 && whichDir.gameStarted:
		dirY = 1
	elif position.y >= 640 && whichDir.gameStarted:
		dirY = -1
	print_debug(speedX)

func _on_area_2d_area_entered(_area):
	dirX *= -1
	
	if speedX < maxSpeed:
		speedX += 2
	if speedX > maxSpeed:
		speedX = maxSpeed
	
	if speedY < maxSpeedY:
		speedY -= 1
	if speedY < 10:
		speedY = 10

func _on_area_2d_top_area_entered(_area):
	dirY = -1


func _on_area_2d_bottom_area_entered(_area):
	dirY = 1
	if speedY < maxSpeedY:
		speedY += 1
	if speedY > maxSpeedY:
		speedY = maxSpeedY

func _on_area_2d_middle_area_entered(_area):
	dirY = whichDir.upDown
	
	if whichDir.playerBounced == 1:
		whichDir.playerBounced = 0
	else:
		whichDir.playerBounced = 1

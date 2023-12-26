extends Node2D

var screensize
var ball
var player_1
var player_2
var p1_score
var p2_score

# Called when the node enters the scene tree for the first time.
func _ready():
	player_1 = get_node("player1")
	player_2 = get_node("player2")
	screensize = get_viewport_rect().size
	p1_score = get_node("p1_score")
	p2_score = get_node("p2_score")
	
	player_1.move_up = "move_up_p1"
	player_1.move_down = "move_down_p1"
	player_2.move_up = "move_up_p2"
	player_2.move_down = "move_down_p2"



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ball_left_screen_on_left():
	print("player 2 scored")
	player_2.score += 1
	p2_score.text = str(player_2.score)


func _on_ball_left_screen_on_right():
	print("player 1 scored")
	player_1.score += 1
	p1_score.text = str(player_1.score)

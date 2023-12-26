extends CharacterBody2D

@export var speed = 400
var screensize
var move_up = "move_up_p1"
var move_down = "move_down_p1"
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed(move_down):
		velocity.y += 1
	if Input.is_action_pressed(move_up):
		velocity.y -= 1
	
	position += velocity * delta * speed
	position = position.clamp(Vector2.ZERO, screensize)

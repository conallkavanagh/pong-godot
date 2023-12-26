extends CharacterBody2D

signal left_screen_on_left
signal left_screen_on_right

@export var base_speed = 400
@export var speed_increase = 50
var screensize
var speed

# Called when the node enters the scene tree for the first time.
func _ready():
	screensize = get_viewport_rect().size
	speed = base_speed
	randomise_direction()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision = move_and_collide(velocity * delta * speed)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().is_class("CharacterBody2D"):
			speed += speed_increase
	
	if position.x < 0: 
		left_screen_on_left.emit()
		respawn(screensize.x / 2, screensize.y / 2)
	elif position.x > screensize.x:
		left_screen_on_right.emit()
		respawn(screensize.x / 2, screensize.y / 2)

func randomise_direction():
	var tmp = randi_range(0, 1) * 2 - 1 # gives us -1 or 1
	velocity = Vector2(float(tmp), 0.0)
	velocity = velocity.rotated(randf_range(-PI / 4, PI / 4))

func respawn(x, y):
	position.x = x
	position.y = y
	speed = base_speed
	randomise_direction()


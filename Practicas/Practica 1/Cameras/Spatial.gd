extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var SENSIBILITY = 0.02

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	orbit()
	
func orbit():
	if Input.is_action_pressed("Left Camera"):
		rotate_y(SENSIBILITY)
	if Input.is_action_pressed("Right Camera"):
		rotate_y(-SENSIBILITY) 

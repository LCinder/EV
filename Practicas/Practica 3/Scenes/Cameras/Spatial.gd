extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var SENSIBILITY = 0.02
var TRANSLATE_SENSIBILITY = 0.05

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_camera()
	
func move_camera():
	if Input.is_action_pressed("Left Camera"):
		rotate_y(SENSIBILITY)
	if Input.is_action_pressed("Right Camera"):
		rotate_y(-SENSIBILITY)

	if Input.is_action_pressed("Move Forward"):
		translate_object_local(Vector3(0, 0, -TRANSLATE_SENSIBILITY))
	if Input.is_action_pressed("Move Backward"):
		translate_object_local(Vector3(0, 0, TRANSLATE_SENSIBILITY))
	if Input.is_action_pressed("Move Left"):
		translate_object_local(Vector3(-TRANSLATE_SENSIBILITY, 0, 0))
	if Input.is_action_pressed("Move Right"):
		translate_object_local(Vector3(TRANSLATE_SENSIBILITY, 0, 0))

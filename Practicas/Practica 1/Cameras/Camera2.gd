extends Camera


var seconds = 0
var SENSIBILITY = 0.02
var LIMIT_Y = 0.6
var y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	orbit()

func orbit():
	y = get_camera_transform().basis.z.y

	if Input.is_action_pressed("Up Camera") and y > -LIMIT_Y:
		rotate_object_local(Vector3(1, 0, 0), SENSIBILITY)
	if Input.is_action_pressed("Down Camera") and y < LIMIT_Y:
		rotate_object_local(Vector3(1, 0, 0), -SENSIBILITY)

func _orbit_y(s):
	rotate_y(s)

func _orbit_every_second(delta):
	seconds += delta

	if seconds >= 1:
		_orbit_y(1)
		seconds = 0

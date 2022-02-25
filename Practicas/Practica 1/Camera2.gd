extends Camera


var seconds = 0
var SENSIBILITY = 0.01
var LIMIT_Y_UP = 0.8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Left Camera"):
		print("y:")
		print(get_camera_transform().basis.y.y)
		print("\n")
		print("z:")
		print(get_camera_transform().basis.y.x)
		print("\n")
		rotate_y(SENSIBILITY)
	if Input.is_action_pressed("Right Camera"):
		print("y:")
		print(get_camera_transform().basis.y.y)
		print("\n")
		print("z:")
		print(get_camera_transform().basis.y.x)
		print("\n")
		rotate_y(-SENSIBILITY)
	if Input.is_action_pressed("Up Camera") and get_camera_transform().basis.y.y >= LIMIT_Y_UP and get_camera_transform().basis.y.z < 0.5:
		print("y:")
		print(get_camera_transform().basis.y.y)
		print("\n")
		print("z:")
		print(get_camera_transform().basis.y.x)
		print("\n")
		rotate_object_local(Vector3(1, 0, 0), SENSIBILITY)
	if Input.is_action_pressed("Down Camera"):# and get_camera_transform().basis.y.y >= LIMIT_Y_UP and get_camera_transform().basis.y.z > -0.5:
		print("y:")
		print(get_camera_transform().basis.y.y)
		print("\n")
		print("z:")
		print(get_camera_transform().basis.y.x)
		print("\n")
		rotate_object_local(Vector3(1, 0, 0), -SENSIBILITY)

func _orbit_y(s):
	rotate_y(s)

func _orbit_every_second(delta):
	seconds += delta

	if seconds >= 1:
		_orbit_y(1)
		seconds = 0

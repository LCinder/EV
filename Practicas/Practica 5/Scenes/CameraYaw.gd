extends Camera


onready var yaw = get_parent()
export var SENSIBILITY = 200
var LIMIT_Y = 0.7
var SENSIBILITY_LIMIT = 0.0008
var y = 0

var TRANSLATE_SENSIBILITY = 0.4

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_Test_camera_player():
	set_current(true)


func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
			get_tree().quit()
			
	if current:
		if event is InputEventMouseMotion:
			yaw.rotate_object_local(Vector3(0, 1, 0), -event.relative.x / 300)
			
			y = get_camera_transform().basis.z.y

			if y > -LIMIT_Y and y < LIMIT_Y:
				rotate_object_local(Vector3(1, 0, 0), -event.relative.y / SENSIBILITY)
				y = get_camera_transform().basis.z.y
				
			elif y > LIMIT_Y:
				rotate_object_local(Vector3(1, 0, 0), SENSIBILITY_LIMIT)
			elif y < -LIMIT_Y:
				rotate_object_local(Vector3(1, 0, 0), -SENSIBILITY_LIMIT)
			
		if Input.is_action_pressed("Move Forward"):
			yaw.translate_object_local(Vector3(0, 0, -TRANSLATE_SENSIBILITY))
		if Input.is_action_pressed("Move Backward"):
			yaw.translate_object_local(Vector3(0, 0, TRANSLATE_SENSIBILITY))
		if Input.is_action_pressed("Move Left"):
			yaw.translate_object_local(Vector3(-TRANSLATE_SENSIBILITY, 0, 0))
		if Input.is_action_pressed("Move Right"):
			yaw.translate_object_local(Vector3(TRANSLATE_SENSIBILITY, 0, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

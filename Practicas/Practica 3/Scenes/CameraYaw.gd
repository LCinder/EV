extends Camera


onready var yaw = get_parent()
var SENSIBILITY = 0.02

var TRANSLATE_SENSIBILITY = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	if event is InputEventMouseMotion:
		print(event.relative.x)	
		rotate_object_local(Vector3(0, 1, 0), event.relative.x / 200)
		
	if Input.is_action_pressed("Move Forward"):
		translate_object_local(Vector3(0, 0, -TRANSLATE_SENSIBILITY))
	if Input.is_action_pressed("Move Backward"):
		translate_object_local(Vector3(0, 0, TRANSLATE_SENSIBILITY))
	if Input.is_action_pressed("Move Left"):
		translate_object_local(Vector3(-TRANSLATE_SENSIBILITY, 0, 0))
	if Input.is_action_pressed("Move Right"):
		translate_object_local(Vector3(TRANSLATE_SENSIBILITY, 0, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

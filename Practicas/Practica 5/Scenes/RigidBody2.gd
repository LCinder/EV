extends KinematicBody


export var gravity = Vector3.DOWN * 10
var vel = Vector3.ZERO

onready var yaw = get_child(0)
export var SENSIBILITY = 200
var LIMIT_Y = 0.7
var SENSIBILITY_LIMIT = 0.0008
var y = 0
var speed = 20
var mouse_showed = false

var TRANSLATE_SENSIBILITY = 0.2


func _physics_process(delta):
	vel += gravity * delta
	#vel = move_and_slide(vel, Vector3.FORWARD)
	move_input()
	vel = move_and_slide(vel, Vector3.UP)
	

func move_input():
	var vy = vel.y
	vel = Vector3.ZERO
	
	if Input.is_action_pressed("Move Forward"):
			#yaw.translate_object_local(Vector3(0, 0, -TRANSLATE_SENSIBILITY))
		vel += -yaw.global_transform.basis.z * speed#transform.basis.z * speed
	if Input.is_action_pressed("Move Backward"):
		vel += yaw.global_transform.basis.z * speed#-transform.basis.z * speed
		#yaw.translate_object_local(Vector3(0, 0, TRANSLATE_SENSIBILITY))
	if Input.is_action_pressed("Move Left"):
		vel += -yaw.global_transform.basis.x * speed#-transform.basis.y * speed
		#yaw.translate_object_local(Vector3(-TRANSLATE_SENSIBILITY, 0, 0))
	if Input.is_action_pressed("Move Right"):
		vel += yaw.global_transform.basis.x * speed#transform.basis.y * speed
		#yaw.translate_object_local(Vector3(TRANSLATE_SENSIBILITY, 0, 0))
	vel.y = vy

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_Test_camera_player():
	$Player/CameraPlayer.set_current(true)


func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
			get_tree().quit()
			
	if Input.is_action_just_pressed("ChangeMouse"):
		mouse_showed = not mouse_showed
		
		if mouse_showed:
			Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			
	if $Player/CameraPlayer.current:
		if event is InputEventMouseMotion:
			yaw.rotate_object_local(Vector3(0, 1, 0), -event.relative.x / 300)
			
			y = $Player/CameraPlayer.get_camera_transform().basis.z.y

			if y > -LIMIT_Y and y < LIMIT_Y:
				$Player/CameraPlayer.rotate_object_local(Vector3(1, 0, 0), -event.relative.y / SENSIBILITY)
				y = $Player/CameraPlayer.get_camera_transform().basis.z.y
				
			elif y > LIMIT_Y:
				$Player/CameraPlayer.rotate_object_local(Vector3(1, 0, 0), SENSIBILITY_LIMIT)
			elif y < -LIMIT_Y:
				$Player/CameraPlayer.rotate_object_local(Vector3(1, 0, 0), -SENSIBILITY_LIMIT)
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

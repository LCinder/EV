extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal camera_player
signal camera_1
signal camera_2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Camera 2"):
		emit_signal("camera_1")
	elif Input.is_action_pressed("Camera 3"):
		emit_signal("camera_2")
	elif Input.is_action_pressed("Camera 1"):
		emit_signal("camera_player")

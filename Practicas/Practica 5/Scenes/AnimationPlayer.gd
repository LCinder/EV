extends AnimationPlayer


# Declare member variables here. Examples:
var abajo = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Play"):
		if abajo:
			play("Subir.005")
		else:
			play("Bajar.002")
		
		abajo = not abajo


func _on_Test_camera_1():
	pass # Replace with function body.

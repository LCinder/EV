extends AnimationPlayer


# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func move_door(abajo):
	if abajo:
		play("Subir.005")
	else:
		play("Bajar.002")
	

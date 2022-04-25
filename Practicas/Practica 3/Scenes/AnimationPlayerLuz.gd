extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var play_light = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Play Luz"):
		play_light = !play_light
		print(play_light)
	
	if play_light:
		play("Luz")
	else:
		seek(0, true)

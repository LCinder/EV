extends KinematicBody


export var gravity = Vector3.DOWN * 10
var vel = Vector3.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	vel = gravity * delta
	vel = move_and_slide(vel, Vector3.UP)

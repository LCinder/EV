extends AnimationPlayer

onready var door = $"../../../Puerta Animacion2".get_node("AnimationPlayer")
var abajo = true

func _ready():
	pass # Replace with function body.


func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			play("Cube.017Action.002")
			abajo = not abajo
			door.move_door(abajo)

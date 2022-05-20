extends Label


var tutorial = true
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if Input.is_action_just_pressed("Tutorial"):
		
		tutorial = not tutorial

		if tutorial:
			set_percent_visible(1.0)
			
		else:
			set_percent_visible(0.0)



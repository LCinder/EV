extends Label


var tutorial = false
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Tutorial"):
		
		if tutorial == true:
			tutorial = false
			set_percent_visible(1.0)
			
		elif tutorial == false:
			tutorial = true
			set_percent_visible(0.0)



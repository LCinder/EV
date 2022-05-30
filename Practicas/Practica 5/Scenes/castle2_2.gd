
onready var castle = $"."
var area_arriba = castle.get_node("AreaArriba")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area3_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	castle.remove_child(area_arriba)
	area_arriba.call_deferred("free")
	var area_abajo = load("res://AreaAbajo.tscn").instance()
	castle.add_child(castle)	

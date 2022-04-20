extends MeshInstance

var vertex = PoolVector3Array()
var index = PoolIntArray()
var size = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	var arr = []
	var aux_mesh = ArrayMesh.new()
	arr.resize(Mesh.ARRAY_MAX)
	self.mesh = CubeMesh.new()

	build_cube()

	arr[Mesh.ARRAY_VERTEX] = vertex
	arr[Mesh.ARRAY_INDEX] = index
	aux_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr)

	self.mesh = aux_mesh


func build_cube():
	# vertices
	vertex.append_array([Vector3(0, 0, 0), Vector3(size, 0, 0), Vector3(size, 0, size), Vector3(0, 0, size), Vector3(0, size, 0), Vector3(size, size, 0), Vector3(size, size, size), Vector3(0, size, size)])
	
	# caras lados
	create_faces(1, 0)
	create_faces(3, 0)
	create_faces(2, 0)
	create_faces(0, 4)
	
	# tapas
	create_faces_2(0, false)
	create_faces_2(4, true)
	
	
func create_faces(v, n):
	index.append_array([v, v+4, v+3+n, v+3+n, v-1+n, v])
	
func create_faces_2(v, reverse):
	if reverse:
		index.append_array([v, v+1, v+2, v+2, v+3, v])
	else:
		index.append_array([v, v+3, v+2, v+2, v+1, v])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

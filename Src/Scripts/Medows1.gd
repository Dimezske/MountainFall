tool
extends Node2D

export var do_distribution := false setget _set_do_distribution
export var clear_distribution := false setget _clear_distribution
export var distribute_on_ready := false
export (float, 0, 1.0) var hue := 0.5
export (int) var instances := 100

export (Vector2) var map_size := Vector2(2000, 2000)
export (Vector2) var map_offset := Vector2(0, 0)

onready var camera = $Player/Camera2D
onready var _mesh_instance := $Mesh as MeshInstance2D
onready var _multi_mesh_instance = $MultiMeshInstance2D as MultiMeshInstance2D
onready var _water_polygon = $WaterArea as Polygon2D

func _ready():
	camera.limit_left = -2000
	camera.limit_top = -2000
	camera.limit_right = 2000
	camera.limit_bottom = 2000
	if distribute_on_ready:
		randomize()
		_do_distribution()

func _do_distribution():
	_mesh_instance = $Mesh as MeshInstance2D
	_multi_mesh_instance = $MultiMeshInstance2D as MultiMeshInstance2D
	_water_polygon = $WaterArea as Polygon2D
	var multi_mesh: MultiMesh = _multi_mesh_instance.multimesh
	multi_mesh.mesh = _mesh_instance.mesh
	multi_mesh.instance_count = instances
	for i in multi_mesh.instance_count:
		var v = Vector2(
			(randf() * map_size.x) + map_offset.x,
			(randf() * map_size.y) + map_offset.y)
		while (_water_polygon.has_point(v)):
			v = Vector2(
				(randf() * map_size.x) + map_offset.x,
				(randf() * map_size.y) + map_offset.y)
			pass
		var t = Transform2D( 0.0, v)
		multi_mesh.set_instance_transform_2d(i, t)
		multi_mesh.set_instance_color(i, Color.from_hsv(hue, randf(), max(randf(), 1.0), 1.0))
		
func _set_do_distribution(value):
	if value:
		_do_distribution()
		
func _clear_distribution(value):
	if value:
		_multi_mesh_instance = $MultiMeshInstance2D as MultiMeshInstance2D
		var multi_mesh: MultiMesh = _multi_mesh_instance.multimesh
		multi_mesh.mesh = null

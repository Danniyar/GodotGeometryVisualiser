extends Node

var pointPrefab = preload("res://prefabs/point.tscn")
var grid
var curObj
var curIndex = -1
var ind = 0
var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

# Called when the node enters the scene tree for the first time.
func _ready():
	grid = get_node('/root/Node3D/Points/Grid')
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_point(nm = null):
	var point = pointPrefab.instantiate()
	point.key = ind
	var par = ind/26
	if(par == 0):
		par = ''
	point.name = alphabet[ind%26] + str(par)
	if nm != null:
		point.name = nm
	hideShow()
	add_child(point)
	point.showInfo()
	return point

func _on_add_pressed(nm = null):
	var pnt =  create_point(nm)
	grid.add_item( pnt.name )
	if nm == null:
		ind += 1
	return pnt

func _on_grid_item_clicked(index, at_position, mouse_button_index):
	var obj = get_node(grid.get_item_text(index))
	obj.showInfo()
	curIndex = index
	pass # Replace with function body.

func checkExistence():
	grid.clear()
	for a in get_children():
		if a.active:
			grid.add_item( a.name )

func hideShow():
	if(is_instance_valid(curObj)):
		curObj.hideInfo()
		curObj = null

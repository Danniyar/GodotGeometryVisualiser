extends Node

var vectorPrefab = preload("res://prefabs/vector.tscn")
var grid
var curObj
var curIndex = -1
var ind = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	grid = get_node('/root/Node3D/Vectors/Grid')
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_vector(A = null, B = null):
	if A == null:
		A = get_node('/root/Node3D/PointsManager/' + str(get_node('/root/Node3D/Vectors/Points/A/ItemList').get_item_text(get_node('/root/Node3D/Vectors/Points/A/ItemList').get_selected_items()[0])) )
	if B == null:
		B = get_node('/root/Node3D/PointsManager/' + str(get_node('/root/Node3D/Vectors/Points/B/ItemList').get_item_text(get_node('/root/Node3D/Vectors/Points/B/ItemList').get_selected_items()[0])) )
	var vector = vectorPrefab.instantiate()
	vector.A = A
	vector.B = B
	vector.name = str(A.name + "-" + B.name)
	if has_node('/root/Node3D/VectorsManager/' + vector.name):
		return
	if(is_instance_valid(curObj)):
		curObj.hideInfo()
	add_child(vector)
	vector.showInfo()
	return vector

func _on_add_pressed():
	get_node('/root/Node3D/FiguresManager').hideShapes()
	hideShow()
	get_node('/root/Node3D/Vectors/Points').show()
	var points = get_node('/root/Node3D/PointsManager').get_children()
	get_node('/root/Node3D/Vectors/Points/A/ItemList').clear()
	get_node('/root/Node3D/Vectors/Points/B/ItemList').clear()
	for a in range(0, points.size()):
		get_node('/root/Node3D/Vectors/Points/A/ItemList').add_item(points[a].name)
		get_node('/root/Node3D/Vectors/Points/B/ItemList').add_item(points[a].name)
	get_node('/root/Node3D/PointsManager').hideShow()
	pass # Replace with function body.

func _on_grid_item_clicked(index, at_position, mouse_button_index):
	var obj = get_node(grid.get_item_text(index))
	if obj == null:
		grid.remove_item(index)
		return
	obj.showInfo()
	curIndex = index
	pass # Replace with function body.

func _on_create_pressed(A = null, B = null):
	if ( get_node('/root/Node3D/Vectors/Points/A/ItemList').get_selected_items().size() == 0 or get_node('/root/Node3D/Vectors/Points/B/ItemList').get_selected_items().size() == 0 ) and A == null and B == null:
		return
	var vct = create_vector(A, B)
	if vct.name == null:
		return
	grid.add_item( vct.name )
	ind += 1
	get_node('/root/Node3D/Vectors/Points').hide()
	return vct

func _on_cancel_pressed():
	get_node('/root/Node3D/Vectors/Points').hide()
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

extends Node

var grid
var curObj
var curIndex = -1
var ind = 0
var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
var cubePrefab = preload("res://prefabs/cube.tscn")
var squarePrefab = preload("res://prefabs/square.tscn")
var trianglePrefab = preload("res://prefabs/triangle.tscn")
var hexagonPrefab = preload("res://prefabs/hexagon.tscn")
var pyramidePrefab = preload("res://prefabs/pyramide.tscn")
var foursidedPyramidePrefab = preload("res://prefabs/4sidepyramide.tscn")
var sixsidedPrismPrefab = preload("res://prefabs/6sideprism.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	grid = get_node('/root/Node3D/Figures/Grid')
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_add_pressed():
	if is_instance_valid(get_node('/root/Node3D/VectorsManager').curObj):
		get_node('/root/Node3D/VectorsManager').curObj.get_node("Info/ActionsList").revertHide()
	grid.get_parent().get_node('Shapes').show()
	get_node('/root/Node3D/VectorsManager')._on_cancel_pressed()

func hideShapes():
	grid.get_parent().get_node('Shapes').hide()

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

func _on_cube_pressed():
	var figure = cubePrefab.instantiate()
	add_child(figure)
	grid.get_parent().get_node('Shapes').hide()
	grid.add_item( figure.name )
	figure.showInfo()
	pass # Replace with function body.

func _on_square_pressed():
	var figure = squarePrefab.instantiate()
	add_child(figure)
	grid.get_parent().get_node('Shapes').hide()
	grid.add_item( figure.name )
	figure.showInfo()
	pass # Replace with function body.

func _on_triangle_pressed():
	var figure = trianglePrefab.instantiate()
	add_child(figure)
	grid.get_parent().get_node('Shapes').hide()
	grid.add_item( figure.name )
	figure.showInfo()
	pass # Replace with function body.

func _on_pyramide_pressed():
	var figure = pyramidePrefab.instantiate()
	add_child(figure)
	grid.get_parent().get_node('Shapes').hide()
	grid.add_item( figure.name )
	figure.showInfo()
	pass # Replace with function body.

func _on_four_sided_pyramide_pressed():
	var figure = foursidedPyramidePrefab.instantiate()
	add_child(figure)
	grid.get_parent().get_node('Shapes').hide()
	grid.add_item( figure.name )
	figure.showInfo()
	pass # Replace with function body.

func _on_hexagon_pressed():
	var figure = hexagonPrefab.instantiate()
	add_child(figure)
	grid.get_parent().get_node('Shapes').hide()
	grid.add_item( figure.name )
	figure.showInfo()
	pass # Replace with function body.

func _on_six_sided_prism_pressed():
	var figure = sixsidedPrismPrefab.instantiate()
	add_child(figure)
	grid.get_parent().get_node('Shapes').hide()
	grid.add_item( figure.name )
	figure.showInfo()
	pass # Replace with function body.

extends Node

var points = []
var posX = 0
var posY = 0
var posZ = 0
var width = 0.1
var height = 0.1
var length = 0.1
var uiPath = "Info"
var active = true
# Called when the node enters the scene tree for the first time.
func _ready():
	for a in range(0, 3):
		var pnt = get_node('/root/Node3D/PointsManager')._on_add_pressed()
		points.append(pnt)
	
	points[1].position.x = 0.1
	points[1].position.y = 0
	points[1].position.z = 0
	points[1].posX = points[1].position.x
	points[1].posY = points[1].position.y
	points[1].posZ = points[1].position.z
	points[1].updateData()
	
	points[2].position.x = 0.05
	points[2].position.y = 0
	points[2].position.z = 5*sqrt(3)*0.01
	points[2].posX = points[2].position.x
	points[2].posY = points[2].position.y
	points[2].posZ = points[2].position.z
	points[2].updateData()
	
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[0], points[1])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[1], points[2])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[2], points[0])
	
	name = "Triangle " + points[0].name + points[1].name + points[2].name
	updateData()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func showInfo():
	get_node('/root/Node3D/PointsManager').hideShow()
	var obj = get_node('/root/Node3D/FiguresManager').curObj
	if(is_instance_valid(obj)):
		obj.hideInfo()
	get_node('/root/Node3D/FiguresManager').curObj = self
	get_node(uiPath).process_mode = PROCESS_MODE_INHERIT
	get_node(uiPath).show()

func hideInfo():
	get_node(uiPath).process_mode = PROCESS_MODE_DISABLED
	get_node(uiPath).hide()

func _on_cur_object_text_submitted(new_text):
	if new_text != '':
		name = new_text
	get_node(uiPath + "/CurObject").text = name
	get_node('/root/Node3D/PointsManager').checkExistence()
	pass # Replace with function body.

func _on_x_value_changed(value):
	var dif = value*0.1-posX
	posX = value*0.1
	for a in range(0, 3):
		if points[a] != null:
			points[a].position.x += dif
			points[a].posX += dif
			points[a].updateData()
	pass # Replace with function body.

func _on_y_value_changed(value):
	var dif = value*0.1-posY
	posY = value*0.1
	for a in range(0, 3):
		if points[a] != null:
			points[a].position.y += dif
			points[a].posY += dif
			points[a].updateData()
	pass # Replace with function body.

func _on_z_value_changed(value):
	var dif = value*0.1-posZ
	posZ = value*0.1
	for a in range(0, 3):
		if points[a] != null:
			points[a].position.z += dif
			points[a].posZ += dif
			points[a].updateData()
	pass # Replace with function body.

func _on_close_pressed():
	get_node('/root/Node3D/FiguresManager').hideShow()
	pass # Replace with function body.

func _on_delete_pressed():
	active = false
	get_node('/root/Node3D/FiguresManager').checkExistence()
	queue_free()
	pass # Replace with function body.

func updateData():
	var curObject = get_node(uiPath + '/CurObject')
	curObject.text = name
	get_node(uiPath + '/X').set_value(posX*10)
	get_node(uiPath + '/Y').set_value(posY*10)
	get_node(uiPath + '/Z').set_value(posZ*10)

func _on_delete_all_pressed():
	for a in range(0, 3):
		if points[a] != null:
			points[a]._on_delete_pressed()
	active = false
	get_node('/root/Node3D/FiguresManager').checkExistence()
	queue_free()
	pass # Replace with function body.

func _on_width_value_changed(value):
	var dif = value*0.1-width
	width = value*0.1
	
	if points[1] != null:
		points[1].position.x += dif
		points[1].posX += dif
		points[1].updateData()
	
	if points[2] != null:
		points[2].position.x = points[0].posX+(points[1].posX-points[0].posX)/2
		points[2].posX = points[2].position.x
		points[2].updateData()

	pass # Replace with function body.

func _on_length_value_changed(value):
	var dif = value*0.1-length
	length = value*0.1
	
	if points[2] != null:
		points[2].position.z += dif
		points[2].posZ += dif
		points[2].updateData()
	
	pass # Replace with function body.

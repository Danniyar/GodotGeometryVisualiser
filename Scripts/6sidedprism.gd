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
	for a in range(0, 12):
		var pnt = get_node('/root/Node3D/PointsManager')._on_add_pressed()
		points.append(pnt)
	
	points[1].position.x = 0
	points[1].position.y = 0
	points[1].position.z = 0.1
	points[1].posX = points[1].position.x
	points[1].posY = points[1].position.y
	points[1].posZ = points[1].position.z
	points[1].updateData()
	
	points[5].position.x = sqrt(3)/2*0.1
	points[5].position.y = 0
	points[5].position.z = -0.05
	points[5].posX = points[5].position.x
	points[5].posY = points[5].position.y
	points[5].posZ = points[5].position.z
	points[5].updateData()
	
	points[2].position.x = sqrt(3)/2*0.1
	points[2].position.y = 0
	points[2].position.z = 0.15
	points[2].posX = points[2].position.x
	points[2].posY = points[2].position.y
	points[2].posZ = points[2].position.z
	points[2].updateData()
	
	points[3].position.x = sqrt(3)*0.1
	points[3].position.y = 0
	points[3].position.z = 0.1
	points[3].posX = points[3].position.x
	points[3].posY = points[3].position.y
	points[3].posZ = points[3].position.z
	points[3].updateData()
	
	points[4].position.x = sqrt(3)*0.1
	points[4].position.y = 0
	points[4].position.z = 0
	points[4].posX = points[4].position.x
	points[4].posY = points[4].position.y
	points[4].posZ = points[4].position.z
	points[4].updateData()
	
	points[6].position.x = 0
	points[6].position.y = 0.1
	points[6].position.z = 0
	points[6].posX = points[6].position.x
	points[6].posY = points[6].position.y
	points[6].posZ = points[6].position.z
	points[6].updateData()
	
	points[7].position.x = 0
	points[7].position.y = 0.1
	points[7].position.z = 0.1
	points[7].posX = points[7].position.x
	points[7].posY = points[7].position.y
	points[7].posZ = points[7].position.z
	points[7].updateData()
	
	points[11].position.x = sqrt(3)/2*0.1
	points[11].position.y = 0.1
	points[11].position.z = -0.05
	points[11].posX = points[11].position.x
	points[11].posY = points[11].position.y
	points[11].posZ = points[11].position.z
	points[11].updateData()
	
	points[8].position.x = sqrt(3)/2*0.1
	points[8].position.y = 0.1
	points[8].position.z = 0.15
	points[8].posX = points[8].position.x
	points[8].posY = points[8].position.y
	points[8].posZ = points[8].position.z
	points[8].updateData()
	
	points[9].position.x = sqrt(3)*0.1
	points[9].position.y = 0.1
	points[9].position.z = 0.1
	points[9].posX = points[9].position.x
	points[9].posY = points[9].position.y
	points[9].posZ = points[9].position.z
	points[9].updateData()
	
	points[10].position.x = sqrt(3)*0.1
	points[10].position.y = 0.1
	points[10].position.z = 0
	points[10].posX = points[10].position.x
	points[10].posY = points[10].position.y
	points[10].posZ = points[10].position.z
	points[10].updateData()
	
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[0], points[1])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[1], points[2])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[2], points[3])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[3], points[4])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[4], points[5])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[5], points[0])
	
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[6], points[7])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[7], points[8])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[8], points[9])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[9], points[10])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[10], points[11])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[11], points[6])
	
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[0], points[6])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[1], points[7])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[2], points[8])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[3], points[9])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[4], points[10])
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(points[5], points[11])
	
	name = "6 Sided Prism " + points[0].name + points[1].name + points[2].name + points[3].name + points[4].name + points[5].name + points[6].name + points[7].name + points[8].name + points[9].name + points[10].name + points[11].name
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
	for a in range(0, 12):
		if points[a] != null:
			points[a].position.x += dif
			points[a].posX += dif
			points[a].updateData()
	pass # Replace with function body.

func _on_y_value_changed(value):
	var dif = value*0.1-posY
	posY = value*0.1
	for a in range(0, 12):
		if points[a] != null:
			points[a].position.y += dif
			points[a].posY += dif
			points[a].updateData()
	pass # Replace with function body.

func _on_z_value_changed(value):
	var dif = value*0.1-posZ
	posZ = value*0.1
	for a in range(0, 12):
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
	for a in range(0, 12):
		if points[a] != null:
			points[a]._on_delete_pressed()
	active = false
	get_node('/root/Node3D/FiguresManager').checkExistence()
	queue_free()
	pass # Replace with function body.

func _on_width_value_changed(value):
	var dif = value*0.1-width
	width = value*0.1
	
	if points[3] != null:
		points[3].position.x += dif
		points[3].posX += dif
		points[3].updateData()
	
	if points[4] != null:
		points[4].position.x += dif
		points[4].posX += dif
		points[4].updateData()
	
	if points[5] != null:
		points[5].position.x = points[0].posX+(points[4].posX-points[0].posX)/2
		points[5].posX = points[5].position.x
		points[5].updateData()
	
	if points[2] != null:
		points[2].position.x = points[0].posX+(points[4].posX-points[0].posX)/2
		points[2].posX = points[2].position.x
		points[2].updateData()
	
	if points[9] != null:
		points[9].position.x += dif
		points[9].posX += dif
		points[9].updateData()
	
	if points[10] != null:
		points[10].position.x += dif
		points[10].posX += dif
		points[10].updateData()
	
	if points[11] != null:
		points[11].position.x = points[0].posX+(points[4].posX-points[0].posX)/2
		points[11].posX = points[11].position.x
		points[11].updateData()
	
	if points[8] != null:
		points[8].position.x = points[0].posX+(points[4].posX-points[0].posX)/2
		points[8].posX = points[8].position.x
		points[8].updateData()

	pass # Replace with function body.
	
func _on_height_value_changed(value):
	var dif = value*0.1-height
	height = value*0.1
	
	if points[6] != null:
		points[6].position.y += dif
		points[6].posY += dif
		points[6].updateData()
	
	if points[7] != null:
		points[7].position.y += dif
		points[7].posY += dif
		points[7].updateData()
	
	if points[8] != null:
		points[8].position.y += dif
		points[8].posY += dif
		points[8].updateData()
	
	if points[9] != null:
		points[9].position.y += dif
		points[9].posY += dif
		points[9].updateData()
	
	if points[10] != null:
		points[10].position.y += dif
		points[10].posY += dif
		points[10].updateData()
	
	if points[11] != null:
		points[11].position.y += dif
		points[11].posY += dif
		points[11].updateData()

func _on_length_value_changed(value):
	var dif = value*0.1-length
	length = value*0.1
	
	if points[2] != null:
		points[2].position.z += dif
		points[2].posZ += dif
		points[2].updateData()
	
	if points[1] != null:
		points[1].position.z = points[2].posZ-(points[2].posZ-points[5].posZ)/4
		points[1].posZ = points[1].position.z
		points[1].updateData()
	
	if points[3] != null:
		points[3].position.z = points[2].posZ-(points[2].posZ-points[5].posZ)/4
		points[3].posZ = points[3].position.z
		points[3].updateData()
	
	if points[4] != null:
		points[4].position.z = points[5].posZ+(points[2].posZ-points[5].posZ)/4
		points[4].posZ = points[4].position.z
		points[4].updateData()
	
	if points[0] != null:
		points[0].position.z = points[5].posZ+(points[2].posZ-points[5].posZ)/4
		points[0].posZ = points[0].position.z
		points[0].updateData()
	
	if points[8] != null:
		points[8].position.z += dif
		points[8].posZ += dif
		points[8].updateData()
	
	if points[7] != null:
		points[7].position.z = points[2].posZ-(points[2].posZ-points[5].posZ)/4
		points[7].posZ = points[7].position.z
		points[7].updateData()
	
	if points[9] != null:
		points[9].position.z = points[2].posZ-(points[2].posZ-points[5].posZ)/4
		points[9].posZ = points[9].position.z
		points[9].updateData()
	
	if points[10] != null:
		points[10].position.z = points[5].posZ+(points[2].posZ-points[5].posZ)/4
		points[10].posZ = points[10].position.z
		points[10].updateData()
	
	if points[6] != null:
		points[6].position.z = points[5].posZ+(points[2].posZ-points[5].posZ)/4
		points[6].posZ = points[6].position.z
		points[6].updateData()
	
	pass # Replace with function body.

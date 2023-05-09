extends MeshInstance3D
var mouse = Vector2()

var posX = 0
var posY = 0
var posZ = 0
var curIndex = -1
var active = true
var curSelected = null
var uiPath = "Info"
var key = -1
# Called when the node enters the scene tree for the first time.
func _ready():
	updateData()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_static_body_3d_input_event(camera, event, position, normal, shape_idx):
	if Input.is_action_just_released("click"):
		showInfo()
	pass # Replace with function body.

func showInfo():
	var obj = get_node('/root/Node3D/PointsManager').curObj
	if(is_instance_valid(obj)):
		obj.hideInfo()
	get_node('/root/Node3D/PointsManager').curObj = self
	get_node(uiPath).process_mode = PROCESS_MODE_INHERIT
	get_node(uiPath).show()
	get_node('/root/Node3D/FiguresManager').hideShow()
	highlight()

func hideInfo():
	get_node(uiPath).process_mode = PROCESS_MODE_DISABLED
	get_node(uiPath).hide()
	unhighlight()
	_on_cancel_pressed()

func _on_x_value_changed(value):
	position.x = value*0.1
	posX = value*0.1
	pass # Replace with function body.


func _on_y_value_changed(value):
	position.y = value*0.1
	posY = value*0.1
	pass # Replace with function body.


func _on_z_value_changed(value):
	position.z = value*0.1
	posZ = value*0.1
	pass # Replace with function body.


func _on_create_vector_pressed():
	get_node(uiPath + "/Vector").show()
	pass # Replace with function body.


func _on_add_pressed():
	if curIndex > -1:
		get_node(uiPath + "/Vector").hide()
	pass # Replace with function body.


func _on_points_item_clicked(index, at_position, mouse_button_index):
	curIndex = index
	pass # Replace with function body.


func _on_close_pressed():
	get_node('/root/Node3D/PointsManager').hideShow()
	pass # Replace with function body.


func _on_delete_pressed():
	active = false
	get_node('/root/Node3D/PointsManager').checkExistence()
	queue_free()
	pass # Replace with function body.


func _on_cur_object_text_submitted(new_text):
	if new_text != '':
		name = new_text
	get_node(uiPath + "/CurObject").text = name
	get_node("NameLabel/SubViewport/Label").text = name
	get_node('/root/Node3D/PointsManager').checkExistence()
	pass # Replace with function body.


func _on_distance_pressed():
	var points = get_node('/root/Node3D/PointsManager').get_children()
	get_node(uiPath + '/Points/A/ItemList').clear()
	for a in range(0, points.size()):
		get_node(uiPath + '/Points/A/ItemList').add_item(points[a].name)
	get_node(uiPath + '/Points').show()
	get_node('/root/Node3D/VectorsManager').hideShow()
	pass # Replace with function body.


func _on_cancel_pressed():
	if curSelected != null:
		curSelected.unhighlight()
		curSelected = null
	get_node(uiPath + '/Points').hide()
	pass # Replace with function body.


func _on_item_list_item_clicked(index, at_position, mouse_button_index):
	if curSelected != null:
		curSelected.unhighlight()
	var point = get_node('/root/Node3D/PointsManager').get_children()[index]
	get_node(uiPath + "/Points/DistanceInfo").text = "Distance: " + str(position.distance_to(point.position)*10)
	point.highlight()
	highlight()
	curSelected = point
	pass # Replace with function body.

func highlight():
	var new_color = get_surface_override_material(0).duplicate()
	new_color.albedo_color = Color.GREEN
	set_surface_override_material(0, new_color)

func unhighlight():
	var new_color = get_surface_override_material(0).duplicate()
	new_color.albedo_color = Color.WHITE
	set_surface_override_material(0, new_color)

func updateData():
	var curObject = get_node(uiPath + '/CurObject')
	curObject.text = name
	get_node("NameLabel/SubViewport/Label").text = name
	get_node(uiPath + '/X').set_value(posX*10)
	get_node(uiPath + '/Y').set_value(posY*10)
	get_node(uiPath + '/Z').set_value(posZ*10)

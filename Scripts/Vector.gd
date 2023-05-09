extends MeshInstance3D
var mouse = Vector2()

var A
var B
var curIndex = -1
var active = true
var posX = 0
var posY = 0
var posZ = 0
var distance = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	var curObject = get_node('Info/CurObject')
	curObject.text = name
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if A == null || B == null:
		delete()
		return
	var nm = A.name + '-' + B.name
	if nm != name:
		nm = A.name + '-' + B.name
		name = nm
		var curObject = get_node('Info/CurObject')
		curObject.text = name
		get_node('/root/Node3D/VectorsManager').checkExistence()
	position.x = A.position.x
	position.y = A.position.y
	position.z = A.position.z
	posX = B.position.x-A.position.x
	posY = B.position.y-A.position.y
	posZ = B.position.z-A.position.z
	var newPos = Vector3(posX/2, posY/2, posZ/2)
	distance = A.position.distance_to(B.position)
	global_translate(newPos)
	if !(B.posX == A.posX && B.posZ == A.posZ):
		look_at(B.position, Vector3.UP)
	else:
		rotation_degrees.x = 90
	get_node('Info/Length').text = "Length: " + str((distance*10))
	get_node('Info/Coordinates').text = "X: " + str( round(posX*10) ) + "\nY: " + str( round(posY*10) ) + "\nZ: " + str( round(posZ*10) )
	if distance != 0:
		scale.z = distance
	else:
		scale.z = 0.000001
	pass


func _on_static_body_3d_input_event(camera, event, position, normal, shape_idx):
	if Input.is_action_just_released("click"):
		showInfo()
	pass # Replace with function body.

func showInfo():
	var obj = get_node('/root/Node3D/VectorsManager').curObj
	if(is_instance_valid(obj)):
		obj.hideInfo()
	get_node('/root/Node3D/VectorsManager').curObj = self
	get_node("Info").process_mode = PROCESS_MODE_INHERIT
	get_node("Info").show()
	highlight()

func hideInfo():
	get_node("Info").process_mode = PROCESS_MODE_DISABLED
	get_node("Info").hide()
	get_node("Info/ActionsList").revertHide()
	unhighlight()

func highlight():
	var new_color = get_surface_override_material(0).duplicate()
	new_color.albedo_color = Color.DEEP_PINK
	set_surface_override_material(0, new_color)

func unhighlight():
	var new_color = get_surface_override_material(0).duplicate()
	new_color.albedo_color = Color.CYAN
	set_surface_override_material(0, new_color)

func _on_points_item_clicked(index, at_position, mouse_button_index):
	curIndex = index
	pass # Replace with function body.

func _on_close_pressed():
	get_node('/root/Node3D/VectorsManager').hideShow()
	pass # Replace with function body.

func delete():
	active = false
	get_node('/root/Node3D/VectorsManager').checkExistence()
	queue_free()
	
func _on_delete_pressed():
	delete()
	pass # Replace with function body.

func _on_actions_pressed():
	get_node('Info/ActionsList').show()
	get_node('/root/Node3D/FiguresManager').hideShapes()
	pass # Replace with function body.

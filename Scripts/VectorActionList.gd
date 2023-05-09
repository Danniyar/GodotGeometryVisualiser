extends Label

var curSelected = null
var ownvector = null

# Called when the node enters the scene tree for the first time.
func _ready():
	ownvector = get_parent().get_parent()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_close_pressed():
	revertHide()
	pass # Replace with function body.

func _on_item_list_item_clicked(index, at_position, mouse_button_index):
	if curSelected != null:
		curSelected.unhighlight()
	var vector = get_node('/root/Node3D/VectorsManager').get_children()[index]
	var mult = ownvector.posX*vector.posX+ownvector.posY*vector.posY+ownvector.posZ*vector.posZ
	var lengthmult = ownvector.distance*vector.distance
	var angle = acos( mult/lengthmult ) * 180/PI
	get_node("ActionDetails/Angle").text = str(int(angle))
	vector.highlight()
	ownvector.highlight()
	curSelected = vector
	pass # Replace with function body.

func showVectorList():
	var vectors = get_node('/root/Node3D/VectorsManager').get_children()
	get_node('Vectors/A/ItemList').clear()
	for a in range(0, vectors.size()):
		get_node('Vectors/A/ItemList').add_item(vectors[a].name)
	get_node('Vectors').show()
	get_node('/root/Node3D/PointsManager').hideShow()

func revertHide():
	get_node('Vectors').hide()
	hide()

func _on_angle_pressed():
	get_node("Actions").hide()
	get_node("ActionDetails/Angle").show()
	showVectorList()
	pass # Replace with function body.

func _on_angle_cancel_pressed():
	get_node("Vectors").hide()
	get_node("ActionDetails/Angle").hide()
	get_node("Actions").show()
	pass # Replace with function body.


func _on_sum_pressed():
	get_node("Actions").hide()
	get_node("ActionDetails/SumAction").show()
	showVectorList()
	pass # Replace with function body.

func _on_sum_action_pressed():
	if curSelected == null:
		return
	var startPoint = ownvector.A
	var endPoint = get_node('/root/Node3D/PointsManager')._on_add_pressed(ownvector.name + 'sum' + curSelected.name)
	endPoint.position.x = ownvector.A.posX + ownvector.posX + curSelected.posX
	endPoint.position.y = ownvector.A.posY + ownvector.posY + curSelected.posY
	endPoint.position.z = ownvector.A.posZ + ownvector.posZ + curSelected.posZ
	endPoint.posX = endPoint.position.x
	endPoint.posY = endPoint.position.y
	endPoint.posZ = endPoint.position.z
	endPoint.updateData()
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(startPoint, endPoint)
	_on_sum_cancel_pressed()
	pass # Replace with function body.

func _on_sum_cancel_pressed():
	get_node("Vectors").hide()
	get_node("ActionDetails/SumAction").hide()
	get_node("Actions").show()
	pass # Replace with function body.

func _on_sub_pressed():
	get_node("Actions").hide()
	get_node("ActionDetails/SubAction").show()
	showVectorList()
	pass # Replace with function body.

func _on_sub_action_pressed():
	if curSelected == null:
		return
	var startPoint = ownvector.A
	var endPoint = get_node('/root/Node3D/PointsManager')._on_add_pressed(ownvector.name + 'sub' + curSelected.name)
	endPoint.position.x = ownvector.A.posX + ownvector.posX - curSelected.posX
	endPoint.position.y = ownvector.A.posY + ownvector.posY - curSelected.posY
	endPoint.position.z = ownvector.A.posZ + ownvector.posZ - curSelected.posZ
	endPoint.posX = endPoint.position.x
	endPoint.posY = endPoint.position.y
	endPoint.posZ = endPoint.position.z
	endPoint.updateData()
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(startPoint, endPoint)
	_on_sub_cancel_pressed()
	pass # Replace with function body.

func _on_sub_cancel_pressed():
	get_node("Vectors").hide()
	get_node("ActionDetails/SubAction").hide()
	get_node("Actions").show()
	pass # Replace with function body.

func _on_mult_pressed():
	get_node("Actions").hide()
	get_node("ActionDetails/MultAction").show()
	showVectorList()
	pass # Replace with function body.

func _on_mult_action_pressed():
	if curSelected == null:
		return
	var startPoint = ownvector.A
	var endPoint = get_node('/root/Node3D/PointsManager')._on_add_pressed(ownvector.name + 'mult' + curSelected.name)
	endPoint.position.x = ownvector.posX + ownvector.posX * curSelected.posX * 10
	endPoint.position.y = ownvector.posY + ownvector.posY * curSelected.posY * 10
	endPoint.position.z = ownvector.posZ + ownvector.posZ * curSelected.posZ * 10
	endPoint.posX = endPoint.position.x
	endPoint.posY = endPoint.position.y
	endPoint.posZ = endPoint.position.z
	endPoint.updateData()
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(startPoint, endPoint)
	_on_mult_cancel_pressed()
	pass # Replace with function body.

func _on_mult_cancel_pressed():
	get_node("Vectors").hide()
	get_node("ActionDetails/MultAction").hide()
	get_node("Actions").show()
	pass # Replace with function body.

func _on_div_pressed():
	get_node("Actions").hide()
	get_node("ActionDetails/DivAction").show()
	showVectorList()
	pass # Replace with function body.

func _on_div_action_pressed():
	if curSelected == null:
		return
	var startPoint = ownvector.A
	var endPoint = get_node('/root/Node3D/PointsManager')._on_add_pressed(ownvector.name + 'div' + curSelected.name)
	endPoint.position.x = 0
	endPoint.position.y = 0
	endPoint.position.z = 0
	if curSelected.posX != 0:
		endPoint.position.x = ownvector.posX + ownvector.posX / curSelected.posX / 10
	if curSelected.posY != 0:
		endPoint.position.y = ownvector.posY + ownvector.posY / curSelected.posY / 10
	if curSelected.posZ != 0:
		endPoint.position.z = ownvector.posZ + ownvector.posZ / curSelected.posZ / 10
	endPoint.posX = endPoint.position.x
	endPoint.posY = endPoint.position.y
	endPoint.posZ = endPoint.position.z
	endPoint.updateData()
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(startPoint, endPoint)
	_on_div_cancel_pressed()
	pass # Replace with function body.

func _on_div_cancel_pressed():
	get_node("Vectors").hide()
	get_node("ActionDetails/DivAction").hide()
	get_node("Actions").show()
	pass # Replace with function body.

func _on_mult_val_pressed():
	get_node("Actions").hide()
	get_node("ActionDetails/MultValAction").show()
	pass # Replace with function body.

func _on_mult_val_action_pressed():
	var value = int(get_node("ActionDetails/MultValAction/MultValue").get_line_edit().get_text())
	var startPoint = ownvector.A
	var endPoint = get_node('/root/Node3D/PointsManager')._on_add_pressed( ownvector.name + 'mult' + str(value) )
	endPoint.position.x = ownvector.posX + ownvector.posX * value
	endPoint.position.y = ownvector.posY + ownvector.posY * value
	endPoint.position.z = ownvector.posZ + ownvector.posZ * value
	endPoint.posX = endPoint.position.x
	endPoint.posY = endPoint.position.y
	endPoint.posZ = endPoint.position.z
	endPoint.updateData()
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(startPoint, endPoint)
	_on_mult_val_cancel_pressed()
	pass # Replace with function body.

func _on_mult_val_cancel_pressed():
	get_node("ActionDetails/MultValAction").hide()
	get_node("Actions").show()
	pass # Replace with function body.

func _on_div_val_pressed():
	get_node("Actions").hide()
	get_node("ActionDetails/DivValAction").show()
	pass # Replace with function body.

func _on_div_val_action_pressed():
	var value = int(get_node("ActionDetails/DivValAction/DivValue").get_line_edit().get_text())
	var startPoint = ownvector.A
	var endPoint = get_node('/root/Node3D/PointsManager')._on_add_pressed( ownvector.name + 'div' + str(value) )
	endPoint.position.x = 0
	endPoint.position.y = 0
	endPoint.position.z = 0
	if value != 0:
		endPoint.position.x = ownvector.posX + ownvector.posX / value
	if value != 0:
		endPoint.position.y = ownvector.posY + ownvector.posY / value
	if value != 0:
		endPoint.position.z = ownvector.posZ + ownvector.posZ / value
	endPoint.posX = endPoint.position.x
	endPoint.posY = endPoint.position.y
	endPoint.posZ = endPoint.position.z
	endPoint.updateData()
	get_node('/root/Node3D/VectorsManager')._on_create_pressed(startPoint, endPoint)
	_on_div_val_cancel_pressed()
	pass # Replace with function body.

func _on_div_val_cancel_pressed():
	get_node("ActionDetails/DivValAction").hide()
	get_node("Actions").show()
	pass # Replace with function body.

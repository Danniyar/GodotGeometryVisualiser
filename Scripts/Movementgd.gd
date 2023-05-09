extends Camera3D

var speed = 1
var moving = false
const H_LOOK_SENS = 0.5
const V_LOOK_SENS = 0.5
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move = Vector3.ZERO
	if(Input.is_action_pressed("forward")):
		move.z -= speed*delta
	if(Input.is_action_pressed("backward")):
		move.z += speed*delta
	if(Input.is_action_pressed("right")):
		move.x += speed*delta
	if(Input.is_action_pressed("left")):
		move.x -= speed*delta
	if(Input.is_action_just_released("exit")):
		get_tree().quit()
	if(Input.mouse_mode == Input.MOUSE_MODE_CAPTURED and moving):
		translate_object_local(move)
	pass
	
func _input(event):
	if(Input.is_action_just_pressed("mouse")):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		moving = true
		var pointobj = get_node('/root/Node3D/PointsManager').curObj
		var vectorobj = get_node('/root/Node3D/VectorsManager').curObj
		var figureobj = get_node('/root/Node3D/FiguresManager').curObj
		if(is_instance_valid(pointobj)):
			pointobj.hideInfo()
		if(is_instance_valid(vectorobj)):
			vectorobj.hideInfo()
		if(is_instance_valid(figureobj)):
			figureobj.hideInfo()
	elif Input.is_action_just_released("mouse"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		moving = false
		var pointobj = get_node('/root/Node3D/PointsManager').curObj
		var vectorobj = get_node('/root/Node3D/VectorsManager').curObj
		var figureobj = get_node('/root/Node3D/FiguresManager').curObj
		if(is_instance_valid(pointobj)):
			pointobj.showInfo()
		if(is_instance_valid(vectorobj)):
			vectorobj.showInfo()
		if(is_instance_valid(figureobj)):
			figureobj.showInfo()
	if event is InputEventMouseMotion and moving:
		rotation_degrees.x -= event.relative.y * V_LOOK_SENS
		rotation_degrees.x = clamp(rotation_degrees.x, -90, 90)
		rotation_degrees.y -= event.relative.x * H_LOOK_SENS

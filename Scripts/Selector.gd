extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_action_pressed("click"):
		var camera = get_viewport().get_camera_3d()
		var position2D = get_viewport().get_mouse_position()
		var dropPlane  = Plane(Vector3(0, 0, 10), 1)
		var position3D = dropPlane.intersects_ray(camera.project_ray_origin(position2D), camera.project_ray_normal(position2D))
		print(position3D)

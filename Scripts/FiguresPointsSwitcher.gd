extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	get_node('/root/Node3D/Points').hide()
	get_node('/root/Node3D/Figures').show()
	hide()
	get_node('/root/Node3D/PointsButton').show()
	get_node('/root/Node3D/PointsManager').hideShow()
	pass # Replace with function body.

func _on_points_button_pressed():
	get_node('/root/Node3D/Points').show()
	get_node('/root/Node3D/Figures').hide()
	show()
	get_node('/root/Node3D/PointsButton').hide()
	get_node('/root/Node3D/FiguresManager').hideShow()
	pass # Replace with function body.

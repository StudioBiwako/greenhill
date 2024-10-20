extends Camera3D

@export var center_object: Node3D  # Reference to the object to orbit around
@export var orbit_speed: float = 0.001  # Speed of orbit rotation
@export var orbit_distance: float = 4  # Distance from center object

var orbit_angle: float = 0.0

func _ready():
	if center_object:
		update_camera_position()

func _process(delta):
	pass

func _input(event):
	var x = event
	var i: int = 30
	if event is InputEventMouseMotion:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT): 
			orbit_angle += event.relative.x * orbit_speed
			update_camera_position()

func update_camera_position():
	if center_object:
		var new_position = Vector3(
			cos(orbit_angle) * orbit_distance,
			3.5,  # Maintain the same height
			sin(orbit_angle) * orbit_distance
		)
		
		global_transform.origin = center_object.global_transform.origin + new_position
		look_at(center_object.global_transform.origin, Vector3.UP)

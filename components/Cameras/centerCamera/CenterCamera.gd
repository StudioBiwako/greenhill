extends Camera3D
"""
This camera focuses around a single center Node3D object

Set the Node3D object in the editor
"""


@export var centerObject: Node3D  # Reference to the object to orbit around
@export var orbitSpeed: float = 0.001  # Speed of orbit rotation
@export var orbitDistance: float = 3  # Distance from center object
@export var maxVerticalAngle: float = 45.0  # Maximum vertical angle in degrees
@export var minVerticalAngle: float = 5.0  # Minimum vertical angle in degrees

var orbitAngleHorizontal: float = 0.0
var orbitAngleVertical: float = 45.0

func _ready():
	if centerObject:
		updateCameraPosition()

func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseMotion:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT): 
			orbitAngleHorizontal += event.relative.x * orbitSpeed
			orbitAngleVertical -= event.relative.y * orbitSpeed  # Inverted for intuitive control
			
			# Clamp vertical angle
			var maxAngleRad = deg_to_rad(maxVerticalAngle)
			var minAngleRad = deg_to_rad(minVerticalAngle)
			orbitAngleVertical = clampf(orbitAngleVertical, minAngleRad, maxAngleRad)
			
			updateCameraPosition()

func updateCameraPosition():
	if centerObject:
		var newPosition = Vector3(
			cos(orbitAngleHorizontal) * cos(orbitAngleVertical) * orbitDistance,
			sin(orbitAngleVertical) * orbitDistance,
			sin(orbitAngleHorizontal) * cos(orbitAngleVertical) * orbitDistance
		)
		
		global_transform.origin = centerObject.global_transform.origin + newPosition
		look_at(centerObject.global_transform.origin, Vector3.UP)

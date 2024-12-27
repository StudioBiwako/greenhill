"""
This camera focuses around a single center Node3D object

Set the Node3D object in the editor
"""


extends Camera3D

@export var centerObject: Node3D
@export var orbitSpeed: float = 0.001
@export var orbitDistance: float = 3
@export var maxVerticalAngle: float = 45.0
@export var minVerticalAngle: float = 5.0
@export var autoRotate: bool = false  # New exported boolean
@export var autoRotateSpeed: float = 0.2  # New exported speed control

var orbitAngleHorizontal: float = 0.0
var orbitAngleVertical: float = 45.0

func _ready():
	if centerObject:
		updateCameraPosition()

func _process(delta):
	if autoRotate:
		orbitAngleHorizontal += autoRotateSpeed * delta  # Add rotation each frame
		updateCameraPosition()

func _input(event):
	if event is InputEventMouseMotion:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT): 
			orbitAngleHorizontal += event.relative.x * orbitSpeed
			orbitAngleVertical -= event.relative.y * orbitSpeed
			
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

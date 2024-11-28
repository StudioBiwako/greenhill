extends Button

# Called when the mouse enters the button area
func _on_mouse_entered():
	print("Mouse is hovering over button")
	# Add your hover effect code here
	# For example:
	modulate = Color(1.2, 1.2, 1.2)  # Makes the button slightly brighter
	scale = Vector2(1.25, 1.25)

# Called when the mouse exits the button area
func _on_mouse_exited():
	print("Mouse stopped hovering over button")
	# Reset any effects you applied
	modulate = Color(1, 1, 1)  # Returns to normal brightness
	scale = Vector2(1, 1)

# Called when the node enters the scene tree
func _ready():
	# Connect the mouse signals
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

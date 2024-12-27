extends MeshInstance3D

func _ready():
	var light = $OmniLight3D 
	var colors = [Color.RED, Color.GREEN, Color.BLUE]
	light.light_color = colors[randi() % 3]
	light.omni_range = 0.025  # Increase this to something like 2.0 or higher
	light.light_energy = 2.00

extends Node3D

var mesh_light_scene = preload("res://components/light/light.tscn") # Create this scene first
const NUM_LIGHTS = 5000
const BASE_RADIUS =50.0  # Tree base width
const HEIGHT = 10.0      # Tree height

func _ready():
    for i in NUM_LIGHTS:
        var instance = mesh_light_scene.instantiate()
        add_child(instance)
        
        var height = randf_range(0, HEIGHT)
        # Radius decreases with height to create triangle shape
        var max_radius = BASE_RADIUS * (1 - height/HEIGHT)
        var angle = randf() * TAU
        var radius = randf_range(0, max_radius)
        
        instance.position = Vector3(
            radius * cos(angle),
            height,
            radius * sin(angle)
        )
extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#kill the view if backspaced
	if Input.is_action_just_pressed("ui_cancel"):
		queue_free()



func _on_button_button_up():
	get_tree().change_scene_to_file("res://levels/Intro/IntroManager.tscn")
	pass # Replace with function body.

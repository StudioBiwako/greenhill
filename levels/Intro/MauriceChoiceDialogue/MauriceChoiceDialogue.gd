extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

'''
	both these buttons should send to 
	the same scene after showing 
	the 2nd maurice dialgoue choice
''' 
#on yes button
func _on_yes_button_up():
	get_tree().change_scene_to_file("res://levels/Intro/Void/Void.tscn")
	pass # Replace with function body.

#on no button
func _on_no_button_up():
	get_tree().change_scene_to_file("res://levels/Intro/Void/Void.tscn")
	pass # Replace with function body.

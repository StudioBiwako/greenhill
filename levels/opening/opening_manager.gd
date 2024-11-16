extends Node2D

const StudioNameScene = preload("res://levels/opening/studio_name/studio_name.tscn")




func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$TransitionScene.transition()


func _on_transition_scene_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(StudioNameScene.instantiate())
	print("scene swapping")
	pass # Replace with function body.

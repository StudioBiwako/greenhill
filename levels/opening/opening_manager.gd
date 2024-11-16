extends Node2D

const StudioNameScene = preload("res://levels/opening/studio_name/studio_name.tscn")
var sceneCount = 0
const MainMenuScene = preload("res://levels/main_menu/game_opening.tscn")
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$TransitionScene.transition()


func _on_transition_scene_transitioned():
	if sceneCount == 0:
		$CurrentScene.get_child(0).queue_free()
		$CurrentScene.add_child(StudioNameScene.instantiate())
		sceneCount = sceneCount + 1 
	elif sceneCount == 1:
		$CurrentScene.get_child(0).queue_free()
		$CurrentScene.add_child(MainMenuScene.instantiate())
		sceneCount = sceneCount + 1 
	print("scene swapping")
	pass # Replace with function body.

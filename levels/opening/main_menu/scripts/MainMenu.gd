extends Control
var SavedGamesPanel = preload("res://levels/opening/main_menu/SavePanel/SavePanel.tscn")

## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_load_intro_pressed():
	print("loading into screen")
	get_tree().change_scene_to_file("res://levels/Intro/IntroManager.tscn")
	return 

func _on_load_credits_pressed():
	SoundManager.stop_music(3)
	print("loading car test screen")
	pass 

'''
Loads custom 3d test scene for testing purposes
stops sound set from opening_manager
'''
func _on_load_3d_test_pressed():
	SoundManager.stop_music(3)
	get_tree().change_scene_to_file("res://levels/carShaderArtTest/CarShaderArtTest.tscn")
	pass 


#Start Button Pressed (don't kill audio on saved game panel openign up)
func _on_start_game_pressed():
	var SavedGamesPanelInstance = SavedGamesPanel.instantiate()
	add_child(SavedGamesPanelInstance)
	pass

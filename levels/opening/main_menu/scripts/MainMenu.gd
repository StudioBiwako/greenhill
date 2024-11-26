extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_load_intro_pressed():
	print("loading into screen")
	get_tree().change_scene_to_file("res://levels/intro_splash_screen/game_opening_splash.tscn")
	return # Replace with function body.


func _on_load_house_pressed():
	print("loading house screen")
	pass # Replace with function body.


func _on_load_sound_test_pressed():
	print("loading sound screen")
	pass # Replace with function body.


func _on_load_3D_car_test():
	print("loading car test screen")
	get_tree().change_scene_to_file("res://levels/carShaderArtTest/CarShaderArtTest.tscn")
	pass 
	
func _on_load_alanna_comicbook_test():
	print("loading comicbook test screen")
	get_tree().change_scene_to_file("res://levels/shader_test/shader_test.tscn")
	pass 


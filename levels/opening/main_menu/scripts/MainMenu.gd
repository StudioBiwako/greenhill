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

func _on_load_3D_car_test():
	print("loading car test screen")
	#var bgSound = SoundManager.get_currently_playing_music()
	#if bgSound:
		#bgSound = bgSound[0]
		#bgSound.stop_music(3)
	SoundManager.stop_music(3)
	get_tree().change_scene_to_file("res://levels/carShaderArtTest/CarShaderArtTest.tscn")
	pass 

func _on_load_credits_pressed():
	SoundManager.stop_music(3)
	print("loading car test screen")
	pass # Replace with function body.

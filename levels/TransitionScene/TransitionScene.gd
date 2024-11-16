extends CanvasLayer

# transition signal
signal transitioned

func _ready():
	#set background of transition layer to none
	$ColorRect.set_color(Color(0,0,0,0))

func transition():
	$AnimationPlayer.play("fade_in")
	print("fading in")



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_in":
		print("emit signal trans")
		emit_signal("transitioned")
		$AnimationPlayer.play("fade_out")
	if anim_name == "fade_out":
		print("fade finished")
	 # Replace with function body.

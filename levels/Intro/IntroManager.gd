extends Node2D
@export var openingAudio: AudioStream
const MauriceChoiceDialogueScene = preload("res://levels/Intro/MauriceChoiceDialogue/MauriceChoiceDialogue.tscn")
#TODO allow to move onto next scene after user accepts 
#     Maurice's request
var timer: Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	if openingAudio:
		SoundManager.play_ambient_sound(openingAudio,2.14)
		#$TransitionScene.transition()
		#TODO fix this up to use transitions...idc about allat rn
		timer = Timer.new()
		add_child(timer)
		timer.wait_time = 5.0  # 5 seconds
		timer.one_shot = true  # Will NOT repeat
		#timer will fire off every 3.4 seconds
		timer.timeout.connect(_on_timer_timeout)
		timer.start()
	else:
		print("no opening audio!!!!!")
	# conduct transition
	# $TransitionScene.transition()
	return

func _on_timer_timeout():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(MauriceChoiceDialogueScene.instantiate())
	$TransitionScene.transition()
	timer.queue_free() #free timer from code
	return
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_transition_scene_transitioned():
	pass # Replace with function body.

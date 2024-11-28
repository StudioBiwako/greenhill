extends Node2D

const StudioNameScene = preload("res://levels/opening/studio_name/studio_name.tscn")
const MainMenuScene = preload("res://levels/opening/main_menu/game_opening.tscn")
@export var openingAudio: AudioStream

var sceneCount = 0
var timer: Timer

func _ready():
	# Create and configure the timer
	SoundManager.play_sound(openingAudio)
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 5.0  # 3 seconds
	timer.one_shot = false  # Will repeat
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		transition_to_next_scene()

func _on_timer_timeout():
	transition_to_next_scene()

func transition_to_next_scene():
	if sceneCount < 2:  # Only transition if we haven't reached the final scene
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
		timer.queue_free()  # Stop the timer after reaching the final scene
	print("scene swapping")

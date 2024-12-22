extends Node2D

# determine if accepted maurice's forgetting
var forgettingAccepted: bool
# determine if input is disabled
var inputEnabled: bool = true
# fade out timer
var fadeTimer: Timer
# dialogue number we're on
var dialogueNumber: int = 0


func _ready():
	fadeTimer = Timer.new()
	self.add_child(fadeTimer)
	fadeTimer.one_shot = true
	fadeTimer.timeout.connect(_on_fade_timer_timeout)

	$CanvasLayer/ChoiceContainer.visible = false
	clearAndAddMauriceText("Please...")
	return

func _on_fade_timer_timeout():
	next()

func clearAndAddMauriceText(text: String):
	var centerText = "[center]" + text + "[/center]"
	$CanvasLayer/VBoxContainer2/VBoxContainer/MauriceDialogue.clear()
	$CanvasLayer/VBoxContainer2/VBoxContainer/MauriceDialogue.fadeTextIn(1.5)
	$CanvasLayer/VBoxContainer2/VBoxContainer/MauriceDialogue.typewriterEffect(centerText)

	
func next():
		dialogueNumber = dialogueNumber + 1
		match dialogueNumber:
			1:
				#should reprint her pleading
				clearAndAddMauriceText("Please... Please....")
			2:
				clearAndAddMauriceText("It's all I can see anymore...")
			3:
				clearAndAddMauriceText("All of you...all of you...")
			4: 
				clearAndAddMauriceText("Please, this time...let me forget...")
				var ChoiceContainer = $CanvasLayer/ChoiceContainer
				#fade in choice container
				ChoiceContainer.visible = true
				create_tween().tween_property(ChoiceContainer, "modulate:a", 1, 3)
				inputEnabled = false
			5: 
				$CanvasLayer/ChoiceContainer.visible = false
				if forgettingAccepted: 
					clearAndAddMauriceText("Thank you...")
				else:
					clearAndAddMauriceText("I'm sorry...")
			6:
				get_tree().change_scene_to_file("res://levels/Intro/Void/Void.tscn")
				#should prob have something to send the choice to a save file


func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and inputEnabled:
		fadeMauriceDialgue()
		print("UI ACCPET")
		print(dialogueNumber)

'''
	both these buttons should send to 
	the same scene after showing 
	the 2nd maurice dialgoue choice
''' 
#on yes button
func _on_yes_button_up():
	forgettingAccepted = true
	inputEnabled = true
	fadeMauriceDialgue()
	var ChoiceContainer = $CanvasLayer/ChoiceContainer
	create_tween().tween_property(ChoiceContainer, "modulate:a", 0, 1.5)
	return 

#on no button
func _on_no_button_up():
	forgettingAccepted = false
	inputEnabled = true
	fadeMauriceDialgue()
	var ChoiceContainer = $CanvasLayer/ChoiceContainer
	create_tween().tween_property(ChoiceContainer, "modulate:a", 0, 1.5)
	return 

func fadeMauriceDialgue():
	$CanvasLayer/VBoxContainer2/VBoxContainer/MauriceDialogue.fadeTextOut(1.5)
	fadeTimer.wait_time=1.5
	fadeTimer.start()
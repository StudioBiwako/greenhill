extends Node2D

var forgettingAccepted: bool
var inputEnabled: bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/ChoiceContainer.visible = false
	clearAndAddMauriceText("Please...")
	pass 

func clearAndAddMauriceText(text: String):
	$CanvasLayer/VBoxContainer2/VBoxContainer/MauriceDialogue.clear()
	$CanvasLayer/VBoxContainer2/VBoxContainer/MauriceDialogue.text = "[center]" + text + "[/center]"
	
func next():
		dialogueNumber = dialogueNumber + 1
		match dialogueNumber:
			1:
				#should reprint her pleading
				clearAndAddMauriceText("Please... Please....")
			2:
				clearAndAddMauriceText("It’s all I can see anymore...")
			3:
				clearAndAddMauriceText("All of you… all of you-")
			4: 
				clearAndAddMauriceText("Please, this time… let me forget...")
				$CanvasLayer/ChoiceContainer.visible = true
				inputEnabled = false
			5: 
				$CanvasLayer/ChoiceContainer.visible = false
				if forgettingAccepted: 
					clearAndAddMauriceText("Thank you...")
				else:
					clearAndAddMauriceText("I'm sorry...")
			6:
				get_tree().change_scene_to_file("res://levels/Intro/Void/Void.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
var dialogueNumber: int = 0
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and inputEnabled:
		next()
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
	next()
	return # Replace with function body.

#on no button
func _on_no_button_up():
	forgettingAccepted = false
	inputEnabled = true
	next()
	return # Replace with function body.



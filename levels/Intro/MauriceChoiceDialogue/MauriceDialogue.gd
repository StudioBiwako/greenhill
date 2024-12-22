extends RichTextLabel
## Enable type writer effect (this needs to be set to true right now otherwise crashes)
@export var typeWriterEnabled: bool = true #TODO implement this when unselected
## type writer effect time (0.1 default)
@export var typeWriterWaitTime: float = 0.1
var timer: Timer
var textLength: int = 0
var displayedCharacters: int = 0
var isTyping: bool = false

func _ready():
	#init shown chars to 0
	self.visible_characters = 0
	if(typeWriterEnabled):
		timer = Timer.new()
		add_child(timer)
		timer.wait_time = typeWriterWaitTime 
		timer.timeout.connect(_on_timer_timeout)
	return

func fadeTextIn(timeToFadeIn: float):
	#color applied to canvas object's alpha, set to 0 so i can then tween that bitch 
	modulate.a = 0
	#apply tween only on this text box on only the modulate.a prop to 1.0 in 1 second
	create_tween().tween_property(self, "modulate:a", 1.0, timeToFadeIn)

func fadeTextOut(timeToFadeOut: float):
	create_tween().tween_property(self, "modulate:a", 0, timeToFadeOut)

func typewriterEffect(textContent: String):
	self.text = textContent
	textLength = text.length()
	displayedCharacters = 0
	isTyping = true
	timer.start()

func _on_timer_timeout():
	if displayedCharacters < textLength:
		displayedCharacters += 1
		self.visible_characters = displayedCharacters
	else:
		isTyping = false
		timer.stop()  

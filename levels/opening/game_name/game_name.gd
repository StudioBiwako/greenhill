extends Node2D
@onready var projectNameAni = $ProjectName

# Called when the node enters the scene tree for the first time.
func _ready():
	projectNameAni.play('playIntroAni')
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

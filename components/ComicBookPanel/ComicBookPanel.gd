extends Node3D

@export var comicTexture: Texture2D

func setImageTexture(newTexture: Texture2D):
	$Sprite3D.texture = newTexture

  
func _ready():
	print("ready")
	$Sprite3D.texture = comicTexture
	#setImageTexture(comicTexture)
	
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

extends CharacterBody2D


@export var shopTexture:Texture

func _ready():
	$Sprite2D.texture = shopTexture

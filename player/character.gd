extends Node2D

@onready var hair = $hair
@onready var outfit = $outfit
const composite_sprites = preload("res://player/character_skin.gd")


var character_sprites

func _ready():
	#character skin
	character_sprites = composite_sprites.new()
	update_hair()
	update_outfit()
#	
	



func update_hair():
	hair.texture = character_sprites.hair_sprite[Character_skin.hair]

func update_outfit():
	outfit.texture = character_sprites.outfit_sprite[Character_skin.outfit]

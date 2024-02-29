extends Node2D

@onready var character_look = $Control/MarginContainer/VBoxContainer/Body/MarginContainer/VBoxContainer/body/player/characterlook

func changeHairIncrease():
#	print_debug(len(Character_skin.hair_sprite))
	if Character_skin.hair == len(Character_skin.hair_sprite)-1:
		Character_skin.hair = 0
	else:
		Character_skin.hair+=1
	character_look.update_hair()

func changeHairDecrease():
	if Character_skin.hair == 0:
		Character_skin.hair = len(Character_skin.hair_sprite)-1
	else:
		Character_skin.hair-=1
	character_look.update_hair()

func changeOutfitIncrease():
	if Character_skin.outfit == len(Character_skin.outfit_sprite)-1:
		Character_skin.outfit = 0
	else:
		Character_skin.outfit+=1
	character_look.update_outfit()

func changeOutfitDecrease():
	if Character_skin.outfit == 0:
		Character_skin.outfit = len(Character_skin.outfit_sprite)-1
	else:
		Character_skin.outfit-=1
	character_look.update_outfit()


func _on_button_pressed():
	changeHairIncrease()


func _on_change_scene_pressed():
	SceneTransition.change_scene("res://scene/entry_scene2.tscn", true)


func _on_button_2_pressed():
	changeHairDecrease()


func _on_outfit_inc_pressed():
	changeOutfitIncrease()


func _on_outfit_dec_pressed():
	changeOutfitDecrease()

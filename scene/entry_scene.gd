extends Node2D

@onready var label =$MarginContainer/VBoxContainer/HBoxContainer/PanelContainer/Label
@onready var start_button = $MarginContainer/VBoxContainer/HBoxContainer/Button
var dialog_set = ["Hello guys how are you doing today! For those of you know are new to my channel, this is Mynx.",
"I am a travel enthusiast. So... today I am here at...Almost-appleville.",
"...Almost-appleville. A few people here at Almost-appleville, have told me that Appleville, which is ...",
"...right next to where I am right now, sells one of the rarest Apple species in the world!!!",
" And you know me! I am a curious little bee. I got to try it.",
"But before we go... let's get dressed up"]
#"You will accompany me as we find and try this apple. Are you ready for this new adventure?"]

@onready var player = $InfluencerPlayer
@onready var target_area = $targetArea

var dialog_index = 0
var speed = 50


func _ready():
	start_button.grab_focus()
	label.text = dialog_set[dialog_index]
	dialog_index+=1

func _on_button_pressed():
	if dialog_index<len(dialog_set):
		label.text = dialog_set[dialog_index]
		dialog_index+=1
	else: 
		SceneTransition.change_scene("res://scene/customization_scene.tscn", true)

#func _physics_process(delta):
#	player.move_and_slide()
#
#
#
#func _on_target_area_area_entered(area):
#	if area.owner.name == "InfluencerPlayer":
#		SceneTransition.change_scene("res://scene/scene.tscn", true)

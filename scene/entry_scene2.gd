extends Node2D

@onready var label =$MarginContainer/VBoxContainer/HBoxContainer/PanelContainer/Label
@onready var start_button = $MarginContainer/VBoxContainer/HBoxContainer/Button
var dialog_set = ["Like I said... the apples they sell are the rarest of the rare",
"I am so happy that you can come along",
"Are you ready for this new adventure?"]

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
		$InfluencerPlayer/wanderlust.visible= false
		player.velocity = player.position.direction_to(target_area.global_position) * speed
		$MarginContainer/VBoxContainer/HBoxContainer/Button.visible = false
		label.text = "Off we goooo!!!"

func _physics_process(delta):
	player.move_and_slide()



func _on_target_area_area_entered(area):
	if area.owner.name == "InfluencerPlayer":
		SceneTransition.change_scene("res://scene/scene.tscn", true)

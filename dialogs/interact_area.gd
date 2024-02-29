class_name Iteractable extends Area2D

@onready var text_label = $"../dialog/MarginContainer/Label"
@onready var dialog_box = $"../dialog"
@onready var bigShopInt = 0

@export var shop_type = 0

var dialog_no_entry = ["NOOOO", "go away", "shooooo"]
var dialog_welcome = ["welcome to your shop!", "How may I help you today?", "Welcome welcome"]




func randomNumberGenerator():
	var rng = RandomNumberGenerator.new()
	var rand_index = rng.randf_range(0, 3)
	return int(rand_index)
	
	
func _on_area_entered(area):
	if shop_type == 0:
		text_label.text = dialog_no_entry[randomNumberGenerator()]
	else: 
		text_label.text = dialog_welcome[randomNumberGenerator()]
	dialog_box.visible = true
	print_debug("entered")
	print_debug(text_label.text)
	print_debug(area.owner)
	
	



func _on_area_exited(area):
	print_debug("exited")
	print_debug(area.owner)
#	text_label.text = ""
	dialog_box.visible = false

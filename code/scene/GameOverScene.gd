extends CanvasLayer





func _on_retry_pressed():
	$"Control/MarginContainer/VBoxContainer/body/1stpage".visible = false
	$"Control/MarginContainer/VBoxContainer/body/1stpage2".visible = true


func _on_narrative_pressed():
	SceneTransition.change_scene("res://scene/story.tscn", true)


func _on_button_pressed():
	SceneTransition.change_scene("res://scene/customization_scene.tscn", true)


func _on_togame_pressed():
	SceneTransition.change_scene("res://scene/scene.tscn", true)

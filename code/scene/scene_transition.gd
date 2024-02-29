extends CanvasLayer
@onready var anim_player = $AnimationPlayerRegular
@onready var Rect = $dissolve_rect

# Called when the node enters the scene tree for the first time.
func change_scene(target_scene, regFlag):
	if regFlag:
		Rect.color = "f2cbc2"
	else:
		Rect.color = "#150103"
	anim_player.play("dissolve")
	await anim_player.animation_finished

		
	get_tree().change_scene_to_file(target_scene)
	
	anim_player.play_backwards("dissolve")

extends Node2D


#for audio transitions
@onready var more_mob =$moremob
var entered
#@onready var all_mob = $allmobs/allmobs_all

func _ready():
	more_mob.visible= false
	entered=false


func _on_conflict_area_top_area_exited(area):
	print_debug("more mob")
	more_mob.visible= true
	more_mob.process_mode = Node.PROCESS_MODE_INHERIT


func _on_area_2d_5_area_entered(area):
	$Player.remove_back_home()




func _on_conflict_area_final_2_area_entered(area):
	$"allmobs/Mob final".visible = true

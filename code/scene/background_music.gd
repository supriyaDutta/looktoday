extends Node2D

@onready var anim_player = $AnimationPlayer

func cross_fade_audio(audio_dissolve):
	match audio_dissolve:
		"1":
			print_debug("track1to2")
		"2":
			print_debug("track2to3")
		"3":
			print_debug("track3to2")
		"4":
			print_debug("track2to1")

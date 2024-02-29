extends CanvasLayer

@onready var btn = $Control2/MarginContainer/PanelContainer/VBoxContainer/PanelContainer2/Button
@onready var text_label = $Control2/MarginContainer/PanelContainer/VBoxContainer/PanelContainer/RichTextLabel
const story_segments = ["[b]Are you confused?[/b]\n\nIt's truly confounding when someone faces exclusion simply for being a little different – whether in appearance or behavior. [b]Dear player, you met your demise for this very reason[/b] – standing out just slightly more than your pixelated peers. Sometimes, even the slightest deviation from the norm can prove fatal, as humans are inclined to make comparative judgments.",
	"[b]This game commemorates[/b] a chilling incident that unfolded in a remote village nestled in Diphu, a region of India's Northeast.\nTwo friends set out to a remote village in Diphu, a region in North East of India. Next day, news read, \"The two men were reportedly headed for Kangthilangso,... which is known for its scenic waterfalls... Around 8 pm, locals attacked their vehicle and pulled them out of the car...They were kicked, punched, dragged and beaten with sticks. ...Nilotpal Das(one of the victims), his hands tied using a yellow nylon rope, is seen pleading with the locals.\"",
	"Another report said, \"According to police sources, locals spotted \"two suspicious\" persons in ... Their \"long hair\" and the SUV ... aroused the suspicion of the villagers, police sources said.\"\n\nThe victims, Nilotpal Das was a sound engineer  while Abhijeet Nath had his own business.", 
	"And yes they looked different - they had long hair.\n\n\nI wonder if they were as [b]confused as you[/b] are feeling [b]now![/b]\n\n\n\n"]
# Called when the node enters the scene tree for the first time.
var story_index=0
func _ready():
	story_index=0
	text_label.text = story_segments[story_index]
	story_index+=1
#	btn.text= "V"

func _on_button_pressed():
	if(story_index<len(story_segments)-1):
		text_label.text = story_segments[story_index]
		story_index+=1
		if story_index == len(story_segments)-1:
			btn.text = "Replay"
	else:
		SceneTransition.change_scene("res://scene/entry_scene.tscn", true)

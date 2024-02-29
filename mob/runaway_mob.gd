extends CharacterBody2D

@export var speed = 50
@export var nav_agent: NavigationAgent2D
#@onready var attackAnim = $AnimationPlayer

var target_node = null
var home_pos = null
const tile_size = 16



func _ready():
	home_pos = self.global_position
	nav_agent.path_desired_distance = 4
	nav_agent.target_desired_distance = 4
#	attackAnim.play("RESET")


func _physics_process(_delta):
	if nav_agent.is_navigation_finished():
		return
	
	var axis = to_local(nav_agent.get_next_path_position()).normalized()
	var intended_velocity = axis * speed
	nav_agent.set_velocity(intended_velocity)

func recalc_path():
	if target_node:
		var player_position = target_node.global_position
		var angle_player = self.global_position.direction_to(player_position) *-1
		var fled_position = angle_player * 10 * tile_size
		nav_agent.target_position =  fled_position
		
	else:
		nav_agent.target_position = home_pos


func _on_recalculate_timer_timeout():
	recalc_path()


func _on_repel_area_entered(area):
	if area.owner.name == "Player":
		target_node = area.owner
	








func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	velocity = safe_velocity
	move_and_slide()

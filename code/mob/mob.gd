extends CharacterBody2D

@export var speed = 50
@export var nav_agent: NavigationAgent2D
@export var limit_top: Area2D
@export var limit_bottom:Area2D
@onready var attackAnim = $AnimationPlayer

var target_node = null
var home_pos = null



func _ready():
	home_pos = self.global_position
	nav_agent.path_desired_distance = 4
	nav_agent.target_desired_distance = 4
	attackAnim.play("RESET")


func _physics_process(_delta):
	if nav_agent.is_navigation_finished():
		return
	
	var axis = to_local(nav_agent.get_next_path_position()).normalized()
	var intended_velocity = axis * speed
	nav_agent.set_velocity(intended_velocity)

func recalc_path():
	if target_node:
		var target_location = target_node.global_position
		if target_node.global_position.y<limit_top.global_position.y:
			target_location.y = limit_top.global_position.y
		if target_node.global_position.y>limit_bottom.global_position.y:
			target_location.y = limit_bottom.global_position.y
		nav_agent.target_position = target_location
		
	else:
		nav_agent.target_position = home_pos



func _on_reculate_timer_timeout():
	recalc_path()


func _on_agro_area_entered(area):
	target_node = area.owner
	attackAnim.play("attackLeft")


func _on_de_agro_area_exited(area):
	if area.owner == target_node:
		target_node = null
		attackAnim.play("RESET")
	


func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	velocity = safe_velocity
	move_and_slide()

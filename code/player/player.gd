extends CharacterBody2D

@export  var MAX_SPEED = 50
@export var ACCELERATION = 1500
@export var FRICTION = 1200

@onready var axis = Vector2.ZERO
@onready var effects = $EffectsAnim
@onready var hurtTimer = $HurtTimer


var currentHealth:int = 10
var flagConflictAreaBlock
var flagConflictFinalArea



var bottomBlock = null
var final_block = null

func _ready():
	effects.play("RESET")
	flagConflictAreaBlock = false
	flagConflictFinalArea = false
#
	
func _process(delta):
	if (currentHealth< 1):
			SceneTransition.change_scene("res://scene/gameoverScene.tscn", false)

func _physics_process(delta):
	move(delta)

func get_input_axis():
	axis = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	axis.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	axis.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up")) 

	return axis.normalized()

func move(delta):
	axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(FRICTION * delta)
	else:
		apply_movement(ACCELERATION * axis * delta)
	move_and_slide()



func apply_friction(amount):
	if velocity.length()>amount:
		velocity -= velocity.normalized() * amount	
	else:
		velocity = Vector2.ZERO

func apply_movement(accel):
	velocity += accel
	velocity = velocity.limit_length(MAX_SPEED)
	if flagConflictAreaBlock == true:
		print_debug(self.global_position.y)
		if self.global_position.y > bottomBlock.y:
			self.global_position.y = bottomBlock.y-4
		print_debug(bottomBlock.y)
	
	if flagConflictFinalArea == true:
		print_debug(self.global_position.y)
		if self.global_position.y > final_block.y:
			self.global_position.y = final_block.y-4
#		print_debug(final.y)



func _on_hurt_box_area_entered(area):

	if area.name == "ConflictAreaBottom":
		print_debug("area entered")
		if flagConflictAreaBlock == false:
			flagConflictAreaBlock = true
		bottomBlock = area.global_position
	
	if area.name == "ConflictAreaFinal":
		print_debug("area entered")
		if flagConflictFinalArea == false:
			flagConflictFinalArea = true
		final_block = area.global_position
	if area.name == "sword":
		currentHealth-=1
		$shout.visible = true
		effects.play("hurtBlink")
		hurtTimer.start()
		await hurtTimer.timeout
		effects.play("RESET")
		print_debug(currentHealth)
		
	
func _on_hurt_box_area_exited(area):
	$shout.visible = false



func _on_askapple_area_entered(area):
	print_debug(area.owner.is_in_group("shop"))
	if area.owner.is_in_group("shop") or area.owner.is_in_group("YesAppleShop"):
		print_debug("asking Apples")
		$"Apple message".visible = true


func _on_askapple_area_exited(area):
	$"Apple message".visible = false
	if area.owner.is_in_group("YesAppleShop"):
		$gotApple.visible= true
		$backhome.visible = true

func remove_back_home():
	$backhome.visible=false

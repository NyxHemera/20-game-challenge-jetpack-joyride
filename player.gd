extends CharacterBody2D

@export var backpack_force = Vector2(0, 1800)
@export var gravity = Vector2(0, 980)
@export var jump_force = Vector2(0, -400)

var is_shooting = false

func _physics_process(delta):
	var jump = Input.is_action_just_pressed("jump")
	var no_jump = Input.is_action_just_released("jump")
	
	apply_gravity(delta)
	
	if jump:
		is_shooting = true
		apply_jump()
	elif no_jump:
		is_shooting = false
	elif is_shooting:
		apply_backpack(delta)
	
	move_and_slide()

func apply_gravity(delta):
	velocity += gravity * delta

func apply_jump():
	if is_on_floor():
		velocity = jump_force
	
func apply_backpack(delta):
	velocity -= backpack_force * delta

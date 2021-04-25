extends KinematicBody
class_name Player
#---------------------------------------------------------------------------------------------------
# signals

#---------------------------------------------------------------------------------------------------
# resources

onready var _foot_step_sound = preload("res://SOUND/footstep_001.wav")
onready var _breathing_sound = preload("res://SOUND/breathing_001.wav")

#---------------------------------------------------------------------------------------------------
# data
var vel = Vector3()
const MAX_SPEED = 20
const JUMP_SPEED = 18
const ACCEL = 4.5

var dir = Vector3()

const DEACCEL = 16
const MAX_SLOPE_ANGLE = 40

onready var camera = $Rotation_Helper/Camera
onready var rotation_helper = $Rotation_Helper

var stamina = 100

onready var last_step_position = global_transform.origin
export var step_size = 1.7

onready var interact_ray_cast = $Rotation_Helper/Camera/RayCast

onready var _sprint_timer = $SprintTimer
#---------------------------------------------------------------------------------------------------
# overrides
func _ready():
	$FootstepPlayer.stream = _foot_step_sound
	$BreathingPlayer.stream = _breathing_sound
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	process_input(delta)
	process_movement(delta)
	process_interact(delta)
	
	if global_transform.origin.y < -250:
		respawn()
	
	
	$CanvasLayer/UI/ProgressBar.value = stamina
	
	if last_step_position.distance_to(global_transform.origin) > step_size and not $FootstepPlayer.playing and is_on_floor():
		last_step_position = global_transform.origin
		$FootstepPlayer.play()
		
func _input(event):
	
	if event is InputEventMouseButton and Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_helper.rotate_x(deg2rad(-event.relative.y * Globals.MOUSE_SENSITIVITY))
		self.rotate_y(deg2rad(event.relative.x * Globals.MOUSE_SENSITIVITY * -1))

		var camera_rot = rotation_helper.rotation_degrees
		camera_rot.x = clamp(camera_rot.x, -70, 70)
		rotation_helper.rotation_degrees = camera_rot

#---------------------------------------------------------------------------------------------------
# events/signals

#---------------------------------------------------------------------------------------------------
# public functions

func respawn():
	var spawner = get_tree().get_nodes_in_group('player_spawn')[0]
	var pos = spawner.get_spawn_point(global_transform.origin)
	
	global_transform.origin = pos
	
	$CanvasLayer/UI.fade()
	
#---------------------------------------------------------------------------------------------------
# private functions

func process_interact(delta):
	var body = interact_ray_cast.get_collider()
	if body is Interactable:
		$CanvasLayer/UI/Label.text = body.interaction_text
		
		if Input.is_action_just_pressed("interact"):
			body.interact(self)
	else:
		$CanvasLayer/UI/Label.text = ''
		
func process_input(delta):
	# ----------------------------------
	# Walking
	dir = Vector3()
	var cam_xform = camera.get_global_transform()

	var input_movement_vector = Vector2()

	if Input.is_action_pressed("movement_forward"):
		input_movement_vector.y += 1
	if Input.is_action_pressed("movement_backward"):
		input_movement_vector.y -= 1
	if Input.is_action_pressed("movement_left"):
		input_movement_vector.x -= 1
	if Input.is_action_pressed("movement_right"):
		input_movement_vector.x += 1

	input_movement_vector = input_movement_vector.normalized()

	# Basis vectors are already normalized.
	dir += -cam_xform.basis.z * input_movement_vector.y
	dir += cam_xform.basis.x * input_movement_vector.x
	# ----------------------------------

	# ----------------------------------
	# Jumping
	if is_on_floor():
		if Input.is_action_just_pressed("movement_jump"):
			vel.y = JUMP_SPEED
	# ----------------------------------

	# ----------------------------------
	# Capturing/Freeing the cursor
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			get_tree().paused = true
	# ----------------------------------
	

func process_movement(delta):
	dir.y = 0
	dir = dir.normalized()

	vel.y += delta * Globals.GRAVITY if !is_on_floor() else 0.0

	var hvel = vel
	hvel.y = 0

	var sprint = Input.is_action_pressed("sprint") and _sprint_timer.time_left <= 0.0 and is_on_floor()
	
	if sprint:
		stamina -= 100.0 * delta
		if stamina <= 0.0:
			sprint = false
			_sprint_timer.start()
	else:
		stamina = min(stamina + 30.0 * delta, 100.0)
		
	
	
	
	var target = dir
	target *= MAX_SPEED * (2.0 if sprint else 1.0)

	var accel
	
	if dir.dot(hvel) > 0:
		accel = ACCEL 
	else:
		accel = DEACCEL

	hvel = hvel.linear_interpolate(target, accel * delta)
	vel.x = hvel.x
	vel.z = hvel.z
	vel = move_and_slide(vel, Vector3(0, 1, 0), 0.05, 4, deg2rad(MAX_SLOPE_ANGLE))

#---------------------------------------------------------------------------------------------------

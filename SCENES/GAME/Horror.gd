extends KinematicBody
class_name Horror
#---------------------------------------------------------------------------------------------------
# signals

#---------------------------------------------------------------------------------------------------
# resources

onready var _scream_sounds = preload("res://SOUND/horror_scream.mp3")

#---------------------------------------------------------------------------------------------------
# data

enum eState {
	IDLE, WALKING
}

export(eState) var state = eState.IDLE

export(NodePath) var target_path

onready var target = get_node(target_path)


var velocity := Vector3.ZERO
const MAX_SLOPE_ANGLE = 40
#---------------------------------------------------------------------------------------------------
# overrides
func _ready():
	$AudioStreamPlayer3D.stream = _scream_sounds

func _process(delta):
	
	velocity += Vector3.DOWN * -Globals.GRAVITY * delta
	
	match state:
		eState.IDLE:
			$AnimationPlayer.play("IDLE")
		eState.WALKING:
			$AnimationPlayer.play("WALK")
			velocity += -global_transform.basis.z * 11.3 * delta
			global_transform.basis = global_transform.basis.slerp(global_transform.looking_at(target.global_transform.origin, Vector3.UP).basis, 0.9975)
		
	velocity = move_and_slide(velocity, Vector3.UP,  0.05, 4, deg2rad(MAX_SLOPE_ANGLE))
	
	var vy = velocity.y
	
	velocity = velocity.linear_interpolate(Vector3.ZERO, 0.5*delta)
	velocity.y = vy


#---------------------------------------------------------------------------------------------------
# events/signals

#---------------------------------------------------------------------------------------------------
# public functions

#---------------------------------------------------------------------------------------------------
# private functions

#---------------------------------------------------------------------------------------------------


func _on_SenseArea_body_entered(body):
	if body is Player:
		state = eState.WALKING
		$AudioStreamPlayer3D.play()
		
func _on_SenseArea_body_exited(body):
	if body is Player:
		state = eState.IDLE
		$AudioStreamPlayer3D.stop()

func _on_KillZone_body_entered(body):
	if body is Player:
		print('killed Player')
		body.respawn()

extends Spatial
#class_name
#---------------------------------------------------------------------------------------------------
# signals

#---------------------------------------------------------------------------------------------------
# resources

export(NodePath) var A_Portal_Node = null
export(NodePath) var B_Portal_Node = null

onready var A_Portal = get_node(A_Portal_Node) if A_Portal_Node else null
onready var B_Portal = get_node(B_Portal_Node) if B_Portal_Node else null

var jumped = false

#---------------------------------------------------------------------------------------------------
# data

#---------------------------------------------------------------------------------------------------
# overrides
func _ready():
	pass

#---------------------------------------------------------------------------------------------------
# events/signals

#---------------------------------------------------------------------------------------------------
# public functions

func clear_a():
	$ABarrier.visible = false
	$ABarrier.use_collision = false

#---------------------------------------------------------------------------------------------------
# private functions

#---------------------------------------------------------------------------------------------------

func _on_A_body_exited(body):
	if body.is_in_group('player'):
		print('badoodle A')
		$ABarrier.visible = true
		$ABarrier.use_collision = true

func _on_B_body_entered(body):
	if body.is_in_group('player') and jumped:
		$ABarrier.visible = false
		$ABarrier.use_collision = false
		jumped = false


func _on_TurnPoint_body_exited(body):
	if body is Player:
		body.global_transform = $TurnPoint/Position3D.global_transform
		jumped = true
		var world = get_tree().get_nodes_in_group('world')[0]
		world.reset_game()


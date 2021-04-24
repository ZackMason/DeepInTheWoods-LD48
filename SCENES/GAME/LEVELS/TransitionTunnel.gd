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

#---------------------------------------------------------------------------------------------------
# private functions

#---------------------------------------------------------------------------------------------------

func _on_A_body_entered(body):
	if body.is_in_group('player'):
		print('badoodle A')

func _on_B_body_entered(body):
	if body.is_in_group('player'):
		print('badoodle B')

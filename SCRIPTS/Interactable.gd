extends Node
class_name Interactable
#---------------------------------------------------------------------------------------------------
# signals

#---------------------------------------------------------------------------------------------------
# resources

#---------------------------------------------------------------------------------------------------
# data

export var interaction_text = 'Press e to interact'

#---------------------------------------------------------------------------------------------------
# overrides
func _ready():
	add_to_group('interactable')

#---------------------------------------------------------------------------------------------------
# events/signals

#---------------------------------------------------------------------------------------------------
# public functions

func interact(node):
	print('%s has interacted with %s' % [node.name, name])

#---------------------------------------------------------------------------------------------------
# private functions

#---------------------------------------------------------------------------------------------------
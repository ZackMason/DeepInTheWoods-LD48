extends Interactable
class_name Gravestone
#---------------------------------------------------------------------------------------------------
# signals

#---------------------------------------------------------------------------------------------------
# resources

#---------------------------------------------------------------------------------------------------
# data

#---------------------------------------------------------------------------------------------------
# overrides
func _ready():
	pass

func _process(delta):
	if PuzzleProgress.ritual_complete():
		interaction_text = 'Press e to complete the ritual'


func interact(node):
	if PuzzleProgress.ritual_complete():
		$RitualPieces.visible = true

#---------------------------------------------------------------------------------------------------
# events/signals

#---------------------------------------------------------------------------------------------------
# public functions

#---------------------------------------------------------------------------------------------------
# private functions

#---------------------------------------------------------------------------------------------------
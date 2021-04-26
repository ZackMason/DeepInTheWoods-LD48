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
	if Input.is_key_pressed(KEY_0) and false:
		var p = get_tree().get_nodes_in_group('player')[0]
		p.global_transform.origin = self.global_transform.origin + Vector3.UP*5.0

func interact(node):
	if PuzzleProgress.ritual_complete():
		$RitualPieces.visible = true
		interaction_text = 'Enter the tunnel, follow the moon'
		PuzzleProgress.ritual_progress.paper = false
		PuzzleProgress.ritual_progress.candle = false
		PuzzleProgress.ritual_progress.skull = false
		
		var tunnel = get_tree().get_nodes_in_group('tunnel')[0]
		
		tunnel.clear_a()

#---------------------------------------------------------------------------------------------------
# events/signals

#---------------------------------------------------------------------------------------------------
# public functions

#---------------------------------------------------------------------------------------------------
# private functions

#---------------------------------------------------------------------------------------------------

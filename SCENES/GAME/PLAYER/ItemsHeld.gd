extends HBoxContainer
#class_name
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
	$Key.visible = PuzzleProgress.has_key
	$Candle.visible = PuzzleProgress.ritual_progress.candle
	$Skull.visible = PuzzleProgress.ritual_progress.skull
	$Paper.visible = PuzzleProgress.ritual_progress.paper

#---------------------------------------------------------------------------------------------------
# events/signals

#---------------------------------------------------------------------------------------------------
# public functions

#---------------------------------------------------------------------------------------------------
# private functions

#---------------------------------------------------------------------------------------------------
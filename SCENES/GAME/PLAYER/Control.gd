extends Control
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
	
func fade():
	var tween = $Tween
	tween.interpolate_property($ColorRect, 'color:a', 255, 0, 1.4, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()
	
#---------------------------------------------------------------------------------------------------
# events/signals

#---------------------------------------------------------------------------------------------------
# public functions

#---------------------------------------------------------------------------------------------------
# private functions

#---------------------------------------------------------------------------------------------------
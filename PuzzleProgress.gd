extends Node
#class_name
#---------------------------------------------------------------------------------------------------
# signals

#---------------------------------------------------------------------------------------------------
# resources

#---------------------------------------------------------------------------------------------------
# data

var _ritual_progress_template := {
	paper = false,
	skull = false,
	candle = false,
}

var ritual_progress = _ritual_progress_template.duplicate()

var has_key = false

#---------------------------------------------------------------------------------------------------
# overrides
func _ready():
	pass
	ritual_complete()
	
func _input(event):
	if Input.is_key_pressed(KEY_8):
		ritual_progress.paper = true
		ritual_progress.candle = true
		ritual_progress.skull = true
		
	
#---------------------------------------------------------------------------------------------------
# events/signals

#---------------------------------------------------------------------------------------------------
# public functions

func reset_ritual():
	ritual_progress = _ritual_progress_template.duplicate()
	has_key = false
	
func ritual_complete():
	var res = ritual_progress.paper
	for b in ritual_progress.values():
		res = res and b
	return res
#---------------------------------------------------------------------------------------------------
# private functions

#---------------------------------------------------------------------------------------------------

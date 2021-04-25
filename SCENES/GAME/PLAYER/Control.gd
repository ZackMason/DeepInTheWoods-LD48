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
	
func blink():
	var tween = $Tween
	tween.interpolate_property($ColorRect, 'color:a', 255, 0, .124, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()
	
func _process(delta):
	$PauseMenu.visible = Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE
#---------------------------------------------------------------------------------------------------
# events/signals

#---------------------------------------------------------------------------------------------------
# public functions

#---------------------------------------------------------------------------------------------------
# private functions

#---------------------------------------------------------------------------------------------------
func _on_Menu_pressed():
	$Settings.visible = true
	get_tree().paused = true

func _on_Resume_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false

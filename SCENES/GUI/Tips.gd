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

#---------------------------------------------------------------------------------------------------
# events/signals

#---------------------------------------------------------------------------------------------------
# public functions

#---------------------------------------------------------------------------------------------------
# private functions

#---------------------------------------------------------------------------------------------------


func _on_TextureButton_pressed():
	get_tree().change_scene("res://SCENES/GUI/Main Menu.tscn")

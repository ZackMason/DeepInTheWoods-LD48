extends Control
#class_name
#---------------------------------------------------------------------------------------------------
# signals

#---------------------------------------------------------------------------------------------------
# resources

onready var _game = preload("res://SCENES/GAME/LEVELS/World.tscn")


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

func _on_Play_pressed():
	get_tree().change_scene("res://SCENES/GAME/LEVELS/World.tscn")


func _on_Exit_pressed():
	get_tree().quit()
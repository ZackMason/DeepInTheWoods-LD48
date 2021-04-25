extends MeshInstance
#class_name
#---------------------------------------------------------------------------------------------------
# signals

#---------------------------------------------------------------------------------------------------
# resources
onready var _candle = preload("res://SCENES/GAME/PUZZLE/Candle.tscn")
#---------------------------------------------------------------------------------------------------
# data

#---------------------------------------------------------------------------------------------------
# overrides
func _ready():
	 $Door.connect('door_opened', self, '_on_door_open')

func _on_door_open():
	$StaticBody/DoorCollision.disabled = true
	$Tween.interpolate_property($Door/house_door, 'rotation:y',
		0, PI/2, 1.7, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	$Tween.start()
	
func reset_game():
	$Door/house_door.rotation.y = 0
	$StaticBody/DoorCollision.disabled = false
	$Door/CollisionShape.disabled = false
	var c = _candle.instance()
	
	$Door/CandleSpawn.add_child(c)
	
	
	
#---------------------------------------------------------------------------------------------------
# events/signals

#---------------------------------------------------------------------------------------------------
# public functions

#---------------------------------------------------------------------------------------------------
# private functions

#---------------------------------------------------------------------------------------------------

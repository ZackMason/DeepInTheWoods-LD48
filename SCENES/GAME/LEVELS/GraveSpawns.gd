extends Spatial
#class_name
#---------------------------------------------------------------------------------------------------
# signals

#---------------------------------------------------------------------------------------------------
# resources

onready var _grave = preload("res://SCENES/GAME/PUZZLE/Gravestone.tscn")

#---------------------------------------------------------------------------------------------------
# data

#---------------------------------------------------------------------------------------------------
# overrides
func _ready():
	randomize()
	spawn()
	
func spawn():
	var spawns = get_children()
	var ri = randi() % spawns.size()
	var spawn = spawns[ri]
	spawn.add_child(_grave.instance())

	print('%s spawned at %d' % [spawn.name, (ri+1)])


#---------------------------------------------------------------------------------------------------
# events/signals

#---------------------------------------------------------------------------------------------------
# public functions

#---------------------------------------------------------------------------------------------------
# private functions

#---------------------------------------------------------------------------------------------------

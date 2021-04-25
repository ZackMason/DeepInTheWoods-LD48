extends Spatial
#class_name
#---------------------------------------------------------------------------------------------------
# signals

#---------------------------------------------------------------------------------------------------
# resources

onready var _paper = preload("res://SCENES/GAME/PUZZLE/Paper.tscn")

#---------------------------------------------------------------------------------------------------
# data

#---------------------------------------------------------------------------------------------------
# overrides
func _ready():
	randomize()
	var spawns = get_children()
	var ri = randi() % spawns.size()
	var spawn = spawns[ri]
	spawn.add_child(_paper.instance())

	print('%s spawned at %d' % [spawn.name, (ri+1)])
#---------------------------------------------------------------------------------------------------
# events/signals

#---------------------------------------------------------------------------------------------------
# public functions

#---------------------------------------------------------------------------------------------------
# private functions

#---------------------------------------------------------------------------------------------------

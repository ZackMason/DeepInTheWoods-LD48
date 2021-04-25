extends Spatial
#class_name
#---------------------------------------------------------------------------------------------------
# signals

#---------------------------------------------------------------------------------------------------
# resources

#---------------------------------------------------------------------------------------------------
# data

export(NodePath) var monster_path

onready var _monster = get_node(monster_path)

var player_not_found = true

var time_since_last_found = 0.0

var monster_chase_time = 120.0

#---------------------------------------------------------------------------------------------------
# overrides
func _ready():
	pass

func _process(delta):
	if player_not_found:
		time_since_last_found += delta
	else:
		time_since_last_found = 0.0
		
	if time_since_last_found > monster_chase_time:
		_spawn_monster()
		time_since_last_found = 0.0
		monster_chase_time = rand_range(40, 90)
#---------------------------------------------------------------------------------------------------
# events/signals

#---------------------------------------------------------------------------------------------------
# public functions

#---------------------------------------------------------------------------------------------------
# private functions

func _spawn_monster():
	
	print('spawning monster')
	
	var player = get_tree().get_nodes_in_group('player')[0]
	var rc = $RayCast
	
	var found = false
	var trys = 6
	
	while not found and trys > 0:
		trys -= 1
		var random_point = Vector3(rand_range(-100,100), 0, rand_range(-100,100))
		random_point = random_point.normalized() * 100.0
		random_point.y = 132.0
		random_point += player.global_transform.origin 
		
		rc.global_transform.origin = random_point
		
		rc.force_raycast_update()
		if rc.is_colliding():
			var pos = rc.get_collision_point()
			_monster.global_transform.origin = pos + Vector3.UP * 4.0
			found = true
#---------------------------------------------------------------------------------------------------

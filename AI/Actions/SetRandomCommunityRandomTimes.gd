extends ActionLeaf

export var spawn_min_time = 3
export var spawn_max_time = 15

export var rethink_min_time = 20
export var rethink_max_time = 30

onready var time_of_last_reset = Time.get_unix_time_from_system()
onready var delay_time = rand_range(spawn_min_time, spawn_max_time)

func _ready():
  randomize()

onready var communities := get_tree().get_nodes_in_group("community")

func tick(actor, _blackboard):
  var current_time := Time.get_unix_time_from_system()
  if current_time - time_of_last_reset < delay_time or actor.get_node("CPUParticles2D").emitting:
    return RUNNING
  else:
    time_of_last_reset = current_time
    delay_time = rand_range(rethink_min_time, rethink_max_time)
    var random_community:Node2D = communities[randi() % communities.size()]
    actor.POI = random_community.global_position
    actor.has_entered_poi = false
    return SUCCESS

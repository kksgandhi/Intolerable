extends ActionLeaf

export var spawn_min_time = 3
export var spawn_max_time = 15

export var rethink_min_time = 20
export var rethink_max_time = 30

export var delay_variable = "timer_delay"

func _ready():
  randomize()

func tick(_actor, blackboard):
  if not blackboard.has(delay_variable):
    blackboard.set(delay_variable, rand_range(spawn_min_time, spawn_max_time))
  else:
    blackboard.set(delay_variable, rand_range(rethink_min_time, rethink_max_time))
  return SUCCESS

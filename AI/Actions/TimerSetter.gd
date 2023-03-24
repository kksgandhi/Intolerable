@icon("res://addons/beehave/icons/action.svg")
extends ActionLeaf

@export var spawn_min_time = 3
@export var spawn_max_time = 15

@export var rethink_min_time = 20
@export var rethink_max_time = 30

@export var delay_variable = "timer_delay"

func _ready():
  randomize()

func tick(_actor, blackboard):
  if not blackboard.has_value(delay_variable):
    blackboard.set_value(delay_variable, randf_range(spawn_min_time, spawn_max_time))
  else:
    blackboard.set_value(delay_variable, randf_range(rethink_min_time, rethink_max_time))
  
  return SUCCESS

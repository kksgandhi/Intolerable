extends ActionLeaf

@onready var communities := get_tree().get_nodes_in_group("community")

func tick(actor, _blackboard):
  var random_community:Node2D = communities[randi() % communities.size()]
  actor.POI = random_community.global_position
  actor.has_entered_poi = false
  return SUCCESS

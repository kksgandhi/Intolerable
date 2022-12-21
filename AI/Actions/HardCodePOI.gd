extends ActionLeaf

export var POI = Vector2(0, 0)

func tick(actor, _blackboard):
  if actor.POI == null:
    actor.POI = POI
  return SUCCESS

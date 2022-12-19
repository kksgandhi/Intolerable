extends ActionLeaf

export var POI = Vector2(0, 0)

func tick(actor, blackboard):
  blackboard.set("POI", POI)
  return SUCCESS

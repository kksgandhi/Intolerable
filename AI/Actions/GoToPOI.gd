extends ActionLeaf

func tick(actor, blackboard):
  var POI = blackboard.get("POI")
  actor.POI = POI
  return SUCCESS

extends ConditionLeaf

func tick(actor, _blackboard):
  return SUCCESS if actor.get_node("CPUParticles2D").emitting else FAILURE

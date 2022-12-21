extends AlwaysSucceedDecorator

func tick(actor, blackboard):
  var response = get_child(0).tick(actor, blackboard)
  if response == RUNNING:
    return SUCCESS
  else: return response

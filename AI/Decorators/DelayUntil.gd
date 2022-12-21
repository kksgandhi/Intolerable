extends Decorator

func tick(actor, blackboard):
  var response = get_child(0).tick(actor, blackboard)

  return SUCCESS if response == SUCCESS else RUNNING

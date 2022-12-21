extends LimiterDecorator

var delay_initiated_time: int = -1

export var delay = 1

func tick(actor, blackboard):
  if delay_initiated_time < 0:
    delay_initiated_time = Time.get_unix_time_from_system()

  var current_time = Time.get_unix_time_from_system()
  if current_time - delay_initiated_time < delay:
    return RUNNING
  else:
    delay_initiated_time = -1
    return self.get_child(0).tick(actor, blackboard)

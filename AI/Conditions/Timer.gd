extends ConditionLeaf

@export var use_constant_delay := true
@export var constant_delay_amount := 1.0

@export var delay_variable    := "timer_delay"
@export var trigger_variable  := ""

@export var autostart := true
@export var autoreset := true

var triggered_time:float = -1
var is_active = false

func trigger():
  triggered_time = Time.get_unix_time_from_system()
  is_active = true

func tick(actor, blackboard):
  if not is_active:
  # timer is not active. Should it be?
    if autostart:
      trigger()
      autostart = false
    elif autoreset:
      trigger()
    elif trigger_variable != "" and blackboard.get(trigger_variable):
      trigger()
    else:
      return SUCCESS

  var delay = -1
  if use_constant_delay:
    delay = constant_delay_amount
  elif delay_variable != "" and blackboard.get_value(delay_variable) != null:
    delay = blackboard.get_value(delay_variable)
  else:
    push_error("Error: Could not set delay in %s, delay variable is unset or null (NodePath: %s)" % [self.name, self.get_path()])

  var current_time = Time.get_unix_time_from_system()
  if current_time - triggered_time < delay:
    return RUNNING
  else:
    is_active = false
  return SUCCESS
  


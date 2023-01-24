extends KinematicBody2D

var POI = null
export var max_speed = 75
  
func _physics_process(_delta):
  _move_to_poi()
  

export(Curve) var speed_curve
export(Curve) var distance_from_poi_curve
export var slowdown_distance = 100
var current_speed_no_distance_slowdown = 0
var current_speed

var has_entered_poi = false

func _move_to_poi():
  if POI == null:
    return

  var vecToPOI = POI - global_position
  vecToPOI = vecToPOI.normalized()
  current_speed_no_distance_slowdown += speed_curve.interpolate(min(current_speed_no_distance_slowdown / max_speed, 1))
  var distance = POI.distance_to(global_position)
  current_speed = distance_from_poi_curve.interpolate(min(1, distance / slowdown_distance)) * current_speed_no_distance_slowdown
  move_and_slide(vecToPOI * current_speed)
  if distance < slowdown_distance and not has_entered_poi:
    # TODO refactor this out
    $CPUParticles2D.restart()
    $CPUParticles2D.emitting = true
    has_entered_poi = true
  
func _ready():
  # scale = Vector2(0, 0)
  pass
  
  
var time_elapsed = 0
export var spawn_speed_modifier = 1.0
export(Curve) var spawn_curve

func _handle_spawn(delta):
  time_elapsed += delta
  var scale_parameter = min(time_elapsed, 1)
  scale_parameter = spawn_curve\
                      .interpolate(
                       min(time_elapsed * spawn_speed_modifier, 1))
  scale = Vector2(scale_parameter, scale_parameter)

func _process(delta):
  # _handle_spawn(delta)
  pass

extends CharacterBody2D

var POI = null
@export var max_speed = 75
  
func _physics_process(_delta):
  _move_to_poi()
  

@export var speed_curve: Curve
@export var distance_from_poi_curve: Curve
@export var slowdown_distance = 100
var current_speed_no_distance_slowdown = 0
var current_speed

var has_entered_poi = false

func _move_to_poi():
  if POI == null:
    return

  var vecToPOI = POI - global_position
  vecToPOI = vecToPOI.normalized()
  current_speed_no_distance_slowdown += speed_curve.sample(min(current_speed_no_distance_slowdown / max_speed, 1))
  var distance = POI.distance_to(global_position)
  current_speed = distance_from_poi_curve.sample(min(1, distance / slowdown_distance)) * current_speed_no_distance_slowdown
  velocity = vecToPOI * current_speed
  move_and_slide()
  if distance < slowdown_distance and not has_entered_poi:
  # TODO refactor this out
    $CPUParticles2D.restart()
    $CPUParticles2D.emitting = true
    has_entered_poi = true
  
func _ready():
  # scale = Vector2(0, 0)
  pass

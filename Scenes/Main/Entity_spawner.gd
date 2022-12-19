extends Node2D

var person = preload("res://Scenes/Person/Person.tscn")

func _input(event):
  if event is InputEventMouseButton and event.is_pressed():
    var person_instance = person.instance()
    person_instance.global_position = event.position
    add_child(person_instance)

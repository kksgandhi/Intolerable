extends Node2D

var person = preload("res://Scenes/Person/Person.tscn")
var simple_person_ai = preload("res://AI/Trees/SimplePerson.tscn")

func _input(event):
  if event is InputEventMouseButton and event.is_pressed():
    var person_instance = person.instance()
    person_instance.global_position = event.position
    person_instance.add_child(simple_person_ai.instance())
    add_child(person_instance)

extends ActionLeaf


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var textToPrint = "Hello World"


# Called when the node enters the scene tree for the first time.
func tick(actor, blackboard):
  print(textToPrint)
  return SUCCESS


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#  pass

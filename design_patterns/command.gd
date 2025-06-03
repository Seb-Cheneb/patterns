## Base class for command pattern implementations that encapsulate actions as objects.
##
## Commands store both the action and its context, enabling:
## - Decoupled input handling
## - Undo/redo systems
## - Action queuing and replay
## - Transactional operations
##
## @param actor: The node that will execute this command
@icon("../pattern.png")
class_name Command extends Node


var _actor: Node
var _class_name = get_script().get_path().get_file().get_basename()


func _init(actor: Node):
	_actor = actor


## Execute the command's primary action.
## @warning: Must be overridden in derived classes
func execute() -> void:
	push_warning("%s :: execute -- method not implemented" % _class_name)


## Reverse the command's effects.
## @note: Store necessary state before execute() for proper undo
func undo() -> void:
	push_warning("%s :: undo -- method not implemented" % _class_name)

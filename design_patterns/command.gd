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
class_name Command extends RefCounted

var _actor: Node


func _init(actor: Node):
	_actor = actor


## Execute the command's primary action.
## @warning: Must be overridden in derived classes
func execute() -> void:
	push_error("Command.execute() not implemented in derived class")

## Reverse the command's effects.
## @note: Store necessary state before execute() for proper undo
func undo() -> void:
	push_error("Command.undo() not implemented in derived class")

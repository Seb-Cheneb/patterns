## Abstract base class for all command pattern implementations.
##
## The Command pattern encapsulates actions as objects, allowing you to:
## - Parameterize objects with different actions
## - Queue commands for deferred execution
## - Implement undo/redo functionality
## - Support logging and transactional operations
##
## Inherit from this class to create concrete command implementations.
## Override [method execute] to define the command's action and [method undo]
## to define how to revert it.
##
## @example:
##     var command = MoveCommand.new(player, Vector2.RIGHT * 32)
##     command.execute()  # Moves player right
##     command.undo()     # Returns player to original position
@icon("../pattern.png")
class_name Command
extends RefCounted

## the actor that will execute the command
var _actor: Node


func _init(actor: Node):
	_actor = actor

## Executes the command's primary action.
##
## Override this method in derived classes to implement the command's behavior.
## This should contain all logic needed to perform the command.
##
## @example:
##     func execute() -> void:
##         target.position += movement
func execute() -> void:
	push_error("Command.execute() not implemented in derived class")


## Reverts the changes made by the execute() method.
##
## Override this method in derived classes to implement undo functionality.
## Should perfectly reverse the effects of execute().
##
## @note: For proper undo functionality, commands should store
##        enough state to return to the pre-execution condition.
func undo() -> void:
	push_error("Command.undo() not implemented in derived class")

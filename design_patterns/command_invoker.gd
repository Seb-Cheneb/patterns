@icon("../pattern.png")
class_name CommandInvoker extends RefCounted

var command_history = []
var undo_history = []


func execute_command(command: Command) -> void:
	command.execute()
	command_history.append(command)
	undo_history.clear() # Clear undo history when a new command is executed


# For commands that support undoing
func undo_last_command() -> void:
	if command_history.size() > 0:
		var last_command = command_history.pop_back()
		if last_command.has_method("undo"):
			last_command.undo()
			undo_history.append(last_command)


# For commands that support redoing
func redo_last_command() -> void:
	if undo_history.size() > 0:
		var last_undo = undo_history.pop_back()
		last_undo.execute()
		command_history.append(last_undo)

@icon("../pattern.png")
class_name StateMachine 
extends Node


@export var initial_state: State

@export_category("Debugging")
@export var is_debugging: bool = false

var states: Dictionary = {}
var current_state: State
var current_state_name: String


func _ready() -> void:
	for child in get_children():
		if child is State:
			child.change_state_signal.connect(change_state)
			states[child.name.to_lower()] = child
			Logger.info(is_debugging, self, "added state \"" + child.name.to_lower() + "\" to state machine")
	
	if initial_state:
		current_state = initial_state
		current_state.name = initial_state.name.to_lower()
		current_state.enter()
	else:
		Logger.warn(is_debugging, self, "no initial state set")

	
func change_state(new_state_name: String) -> void:
	# sanity check
	new_state_name = new_state_name.to_lower()
	
	if current_state_name == new_state_name:
		Logger.warn(is_debugging, self, "trying to change to the same state")
		return
		
	var new_state: State = states[new_state_name]
	
	if not new_state:
		Logger.warn(is_debugging, self, "could not find state \"" + new_state_name +"\"")
		return
	
	if current_state:
		current_state.exit()
		
	current_state = new_state
	current_state_name = new_state_name
	current_state.enter()

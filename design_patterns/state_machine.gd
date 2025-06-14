@icon("../pattern.png")
class_name StateMachine extends Node


@export var initial_state: State

@export_category("Debugging")
@export 
var is_debugging: bool = false

var states: Dictionary = {}
var current_state: State
var current_state_name: String
var previous_state_name: String


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	
	for child in get_children():
		if child is State:
			child.change_state_signal.connect(change_state)
			states[child.name.to_lower()] = child
	
	if initial_state:
		current_state = initial_state
		current_state.name = initial_state.name.to_lower()
		current_state.enter()
		process_mode = Node.PROCESS_MODE_INHERIT
	else:
		Logger.warn(is_debugging, self, "no initial state set")


func _process(delta: float) -> void:
	current_state.on_process(delta)


func _physics_process(delta: float) -> void:
	current_state.on_physics_process(delta)
	
	
func _unhandled_input(event: InputEvent) -> void:
	current_state.on_unhandled_input(event)
	
	
func change_state(new_state_name: String) -> void:
	# sanity check
	new_state_name = new_state_name.to_lower()
	
	if current_state_name == new_state_name:
		Logger.warn(is_debugging, self, "trying to change the state to the same state")
		return
		
	var new_state: State = states[new_state_name]
	
	if not new_state:
		Logger.warn(is_debugging, self, "could not change to the state named \"" + new_state_name +"\"")
		return
		
	current_state.exit()
	new_state.enter()
	previous_state_name = current_state.name
	current_state = new_state
	current_state_name = new_state_name

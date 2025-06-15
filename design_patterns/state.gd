@icon("../pattern.png")
class_name State 
extends Node


signal change_state_signal

@export 
var actor: Node3D

@export_category("Debugging")
@export 
var is_debugging: bool = false

func _ready() -> void:
	# States start disabled - only the current state will be enabled
	process_mode = Node.PROCESS_MODE_DISABLED


func enter() -> void:
	# Enable processing when entering the state
	process_mode = Node.PROCESS_MODE_INHERIT
	Logger.info(is_debugging, self, "entered state: " + name)


func exit() -> void:
	# Disable processing when exiting the state
	process_mode = Node.PROCESS_MODE_DISABLED
	Logger.info(is_debugging, self, "exited state: " + name)

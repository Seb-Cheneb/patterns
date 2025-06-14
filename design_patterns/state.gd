@icon("../pattern.png")
class_name State extends Node


signal change_state_signal

@export var actor: Node3D

@export_category("Debugging")
@export var is_debugging: bool = false


func enter() -> void:
	Logger.warn(is_debugging, self, "method not implemented")


func exit() -> void:
	Logger.warn(is_debugging, self, "method not implemented")


func on_ready() -> void:
	Logger.warn(is_debugging, self, "method not implemented")

	
func on_process(delta : float) -> void:
	Logger.warn(is_debugging, self, "method not implemented")


func on_physics_process(delta : float) -> void:
	Logger.warn(is_debugging, self, "method not implemented")
	

func on_unhandled_input(event: InputEvent) -> void:
	Logger.warn(is_debugging, self, "method not implemented")

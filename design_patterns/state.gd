@icon("../pattern.png")
class_name State extends Node

signal transition 
static var player: Player


func _ready() -> void:
	push_warning("State :: _ready -- method not implemented")


func enter() -> void:
	push_warning("State :: enter -- method not implemented")


func exit() -> void:
	printerr("State :: exit -- method not implemented")
	
	
func process(_delta : float) -> State:
	push_warning("State :: process -- method not implemented")
	return null


func physics_process(_delta : float) -> State:
	push_warning("State :: physics_process -- method not implemented")
	return null
	

func unhandled_input(event: InputEvent) -> State:
	push_warning("State :: unhandled_input -- method not implemented")
	return null

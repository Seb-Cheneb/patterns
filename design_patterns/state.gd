@icon("../pattern.png")
class_name State extends Node

signal transition 
static var player: Player


func _ready() -> void:
	printerr("method not implemented")


func enter() -> void:
	printerr("method not implemented")
	
	
func process(_delta : float) -> State:
	return null


func physics_process(_delta : float) -> State:
	return null
	

func unhandled_input(event: InputEvent) -> State:
	return null
	

#func next_transition() -> void:
	#printerr("method not implemented")


func exit() -> void:
	printerr("method not implemented")

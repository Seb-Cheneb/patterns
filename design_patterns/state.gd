@icon("../pattern.png")
class_name State extends Node

signal transition 

@export var player: Player

var owner_class = get_script().get_path().get_file().get_basename()


func _ready() -> void:
	push_warning("%s :: _ready -- method not implemented" % owner_class)


func enter() -> void:
	push_warning("%s :: enter -- method not implemented" % owner_class)


func exit() -> void:
	push_warning("%s :: exit -- method not implemented" % owner_class)
	
	
func process(_delta : float) -> State:
	push_warning("%s :: process -- method not implemented" % owner_class)
	return null


func physics_process(_delta : float) -> State:
	push_warning("%s :: physics_process -- method not implemented" % owner_class)
	return null
	

func unhandled_input(event: InputEvent) -> State:
	push_warning("%s :: unhandled_input -- method not implemented" % owner_class)
	return null

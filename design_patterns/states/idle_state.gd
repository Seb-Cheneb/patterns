class_name IdleState
extends State


@export var rig_pivot: Node3D
@export var camera_component: ThirdPersonCamera
@export var animation_decay: float = 20
@export var animation_tree: AnimationTree
@export var blendspace: String

var direction: Vector3 = Vector3.ZERO # the direction the actor is looking at


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
	if event in ["move_left", "move_right", "move_forward", "move_back"]:
		var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
		var input_vector := Vector3(input_dir.x, 0, input_dir.y).normalized()
		var direction := camera_component.horizontal_pivot.global_transform.basis * input_vector
		change_state_signal.emit("Walk", direction)

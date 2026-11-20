class_name GameManager extends Node2D

static var me :Node2D
static var score : int = 0
static var continuos_actions : Signal

#Awake
func _init() -> void:
	print_debug("Game Started")
	me = self
	score = 0
	pass

	# Fixed_update
func _physics_process(delta: float) -> void:
	continuos_actions.emit()
	pass
	
	
static func delay_action(action: Callable, delay:float) -> void:
	await me.get_tree().create_timer(delay).timeout
	action.call()
	pass

class_name GameManager extends Node2D

static var score : int = 0

#Awake
func _init() -> void:
	print_debug("Game Started")
	score = 0
	pass

# Start
func _ready() -> void:
	pass

# Update
func _process(delta: float) -> void:
	pass
	
	# Fixed_update
func _physics_process(delta: float) -> void:
	pass

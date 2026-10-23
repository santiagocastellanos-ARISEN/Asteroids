extends Node2D

#Awake
func _init() -> void:
	pass

# Start
func _ready() -> void:
	print_debug("Game Started")

# Update
func _process(delta: float) -> void:
		if(Input.is_action_just_pressed("Shoot")) : print_debug("Shooted")
		if(Input.is_action_pressed("UP")) : print_debug("Going Up")
		if(Input.is_action_pressed("Down")) : print_debug("Going Down")
		if(Input.is_action_pressed("Left")) : print_debug("Going Left")
		if(Input.is_action_pressed("Right")) : print_debug("Going Right")
		pass
	
	# Fixed_update
func _physics_process(delta: float) -> void:
	pass

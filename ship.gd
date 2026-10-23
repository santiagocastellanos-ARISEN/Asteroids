class_name Ship extends RigidBody2D

@export_range(200,800,15) var speed : float = 600

@export_category ("Shooting")
@export var bullet : PackedScene
@export var pivot : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Shoot"):
		_shoot()
	var direction : Vector2 = Input.get_vector("Left","Right","UP","Down").normalized()
	linear_velocity = direction * speed
	pass
	
func _take_dmg() -> void:
	print_debug("Ship Destroyed")
	queue_free() #Destroys the Object
	
	pass
	
func _shoot() -> void:
	var bulletObj = (bullet.instantiate() as Bullet)
	get_parent().add_child(bulletObj)
	bulletObj.global_position = pivot.global_position
	bulletObj.linear_velocity = Vector2.UP * 1000
	pass

class_name Ship extends RigidBody2D

@export_range(1,5) var hitPoints = 3

@export_range(200,800,15) var speed : float = 600

@export_category ("Shooting")
@export var bullet : PackedScene
@export var pivot : Node2D

var iFrames = 0
var initPos : Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initPos = global_position
	print_debug(initPos)
	pass

func _physics_process(delta: float) -> void:
	if iFrames > 0:
		iFrames -= 1
		
	if Input.is_action_just_pressed("Shoot"):
		_shoot()
	var direction : Vector2 = Input.get_vector("Left","Right","UP","Down").normalized()
	linear_velocity = direction * speed
	pass
	
func _take_dmg() -> void:
	if iFrames > 0: return
	
	hitPoints = -1
	print_debug("Damage")
	global_position = initPos
	iFrames = 10
	linear_velocity = Vector2.ZERO
	print_debug("Damage")


	if hitPoints == 0:
		print_debug("Ship Destroyed")
		queue_free() #Destroys the Object
		pass
		
	global_position = initPos
	linear_velocity = Vector2.ZERO
	iFrames = 10

	pass

	
func _shoot() -> void:
	var bulletObj = (bullet.instantiate() as Bullet)
	get_parent().add_child(bulletObj)
	bulletObj.global_position = pivot.global_position
	bulletObj.linear_velocity = Vector2.UP * 1000
	pass

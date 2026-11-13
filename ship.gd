class_name Ship extends RigidBody2D

@export_range(1,5) var hitPoints = 3

@export_range(200,800,15) var speed : float = 600

@export_category ("Shooting")
@export var bullet : PackedScene
@export var pivot : Node2D

var iFrames = 0
var initPos : Vector2
var respawn_timer : NeoTimer 
var scene : Node2D

func _ready() -> void:
	initPos = global_position
##	
##	respawn_timer = NeoTimer.new()
##	respawn_timer.timeout.connect(respawn)
##	respawn_timer.one_shot = true
##
##	scene = get_parent()
##	pass

func _physics_process(delta: float) -> void:
	respawn_timer.tick(delta)
	
	if iFrames > 0:
		iFrames -= 1
		
	if Input.is_action_just_pressed("Shoot"):
		_shoot()
	var direction : Vector2 = Input.get_vector("Left","Right","UP","Down").normalized()
	linear_velocity = direction * speed
	pass

func _take_dmg() -> void:
	if iFrames > 0: return
	##despawn()
	respawn_timer.start(0.5)
	if hitPoints >= 0: return
	queue_free() #Destroys the Object
	print_debug("Ship Destroyed")
	pass
	
##func despawn() -> void:
##	get_parent().remove_child(self)
##	pass
##	
##func respawn() -> void:
##	scene.add_child(self)
##	teleport(initPos)
##	linear_velocity = Vector2.ZERO
##	iFrames = 10
##	pass

func _shoot() -> void:
	var bulletObj = (bullet.instantiate() as ABullet)
	get_parent().add_child(bulletObj)
	bulletObj.global_position = pivot.global_position
	bulletObj.linear_velocity = Vector2.UP * 1000
	pass
	
func teleport(pos : Vector2) -> void:
	PhysicsServer2D.body_set_state(
		get_rid(),
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		Transform2D.IDENTITY.translated(pos)
	)
	pass

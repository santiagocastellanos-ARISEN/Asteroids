class_name Asteroid extends RigidBody2D

enum Size
{
	Big, Medium, Small
}

@export var size : Size = Size.Big

func _validate_size() -> void:
	var set_scale = 0
	
	if size == Size.Big: set_scale = 1
	if size == Size.Medium: set_scale = 0.5
	else: set_scale = 0.3
	
	for child in get_children():
		(child as Node2D).global_scale *= set_scale
	pass

func _physics_process(delta: float) -> void:
	var colliders = get_colliding_bodies()
	for obj in colliders:
		if !(obj is Ship):continue
		(obj as Ship)._take_dmg()
	pass
	
func _take_dmg() -> void:
	GameManager.score += 10
	
	if size == Size.Small: 
		queue_free() #Destroys the Object
		return
				
	var newAsteroid1 = duplicate() as Asteroid
	var newAsteroid2 = duplicate() as Asteroid
	get_parent().add_child(newAsteroid1)
	get_parent().add_child(newAsteroid2)
	
	var newSize = Size.Medium
	if size == Size.Medium: newSize = Size.Small
	
	newAsteroid1.size = newSize
	newAsteroid2.size = newSize
	
	newAsteroid1._validate_size()
	newAsteroid2._validate_size()
	
	newAsteroid1.global_position = global_position + Vector2.RIGHT
	newAsteroid2.global_position = global_position + Vector2.LEFT

	queue_free() #Destroys the object
	pass
	

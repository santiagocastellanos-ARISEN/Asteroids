class_name Bullet extends RigidBody2D

func _physics_process(delta: float) -> void:
	var colliders = get_colliding_bodies()
	for obj in colliders:
		if!(obj is Asteroid): continue
		(obj as Asteroid)._take_dmg()
	pass
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

class_name RegularBullet extends Bullet

func on_impact(asteroid : A_Asteroid) -> void:
	if is_instance_valid(asteroid):
		asteroid.take_dmg()
	queue_free()

class_name PiercingBullet extends Bullet

@export var piercing : int = 3

func on_impact(asteroid : A_Asteroid) -> void:
	if is_instance_valid(asteroid):
		asteroid.take_dmg()
	piercing -= 1
	if piercing <= 0:
		queue_free()

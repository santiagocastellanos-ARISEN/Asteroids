class_name NormalAsteroid extends A_Asteroid

enum Size { Big, Medium, Small }

const SCALE_BY_SIZE : Dictionary = {
	Size.Big: 1.0,
	Size.Medium: 0.5,
	Size.Small: 0.3,
}

@export var size : Size = Size.Big

func _set_size(new_size : Size) -> void:
	var factor : float = SCALE_BY_SIZE[new_size] / SCALE_BY_SIZE[size]
	size = new_size
	for child in get_children():
		if child is Node2D:
			(child as Node2D).scale *= factor

func on_dmg_tkn() -> void:
	if size == Size.Small:
		queue_free()
		return

	var new_size : Size = Size.Medium if size == Size.Big else Size.Small

	var a1 := duplicate() as NormalAsteroid
	var a2 := duplicate() as NormalAsteroid
	get_parent().add_child(a1)
	get_parent().add_child(a2)

	a1._set_size(new_size)
	a2._set_size(new_size)

	a1.global_position = global_position + Vector2.RIGHT * 10
	a2.global_position = global_position + Vector2.LEFT * 10

	queue_free()

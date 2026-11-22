@abstract class_name Bullet extends Area2D

@export var speed : float = 600.0
@export var direction : Vector2 = Vector2.UP

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_body_entered(body: Node2D) -> void:
	if body is A_Asteroid:
		on_impact.call_deferred(body as A_Asteroid)

func _on_screen_exited() -> void:
	queue_free()

@abstract func on_impact(asteroid : A_Asteroid) -> void

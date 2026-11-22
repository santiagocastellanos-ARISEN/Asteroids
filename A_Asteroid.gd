@abstract class_name A_Asteroid extends RigidBody2D

@export_range(0, 500) var reward : int = 10

signal on_dmg_tkn_signal

func _ready() -> void:
	body_entered.connect(damage_ship)

func damage_ship(other : Node) -> void:
	if !(other is Ship): return
	(other as Ship)._take_dmg()

func take_dmg() -> void:
	GameManager.score += reward
	on_dmg_tkn()
	on_dmg_tkn_signal.emit()

@abstract func on_dmg_tkn() -> void

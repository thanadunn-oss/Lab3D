extends Node3D

@export var collectible_count := 0

func _ready() -> void:
	GameManager.configure_level(collectible_count)

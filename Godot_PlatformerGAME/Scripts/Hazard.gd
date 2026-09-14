extends Area3D

@export var spin_speed := 3.0
@onready var player_spawn := get_tree().get_first_node_in_group("Spawn") as Node3D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _process(delta: float) -> void:
	rotation.y += spin_speed * delta

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player") and player_spawn:
		body.global_position = player_spawn.global_position
		if body is CharacterBody3D:
			body.velocity = Vector3.ZERO

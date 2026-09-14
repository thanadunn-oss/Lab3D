extends Node3D

# The supplied Soldier mesh has no compatible run cycle, so this keeps its motion
# readable with the starter controller's Idle, Run, and Jump states.
var base_y := 0.02
var phase := 0.0

func _process(delta: float) -> void:
	var player := get_parent().get_parent() as CharacterBody3D
	if player == null:
		return
	var speed := Vector2(player.velocity.x, player.velocity.z).length()
	if not player.is_on_floor():
		rotation.z = lerp(rotation.z, -0.12, delta * 8.0)
		position.y = lerp(position.y, base_y, delta * 8.0)
	elif speed > 0.15:
		phase += delta * 12.0
		rotation.z = sin(phase) * 0.04
		position.y = base_y + abs(sin(phase)) * 0.035
	else:
		rotation.z = lerp(rotation.z, 0.0, delta * 8.0)
		position.y = lerp(position.y, base_y, delta * 8.0)

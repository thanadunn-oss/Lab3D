extends Area3D

@export_file("*.tscn") var next_scene: String
@export var completion_text := "MISSION COMPLETE!"

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node3D) -> void:
	if not body.is_in_group("Player"):
		return
	if not GameManager.has_all_collectibles():
		return
	if next_scene.is_empty():
		var completion := get_tree().current_scene.get_node_or_null("Canvas/Completion")
		if completion:
			completion.visible = true
		get_tree().paused = true
		return
	get_tree().change_scene_to_file(next_scene)

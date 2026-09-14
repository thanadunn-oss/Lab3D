extends Node3D

# ---------- VARIABLES ---------- #

var score = 0
var level_score = 0
var level_total = 0

# ---------- FUNCTIONS ---------- #

func _process(_delta):
	show_mouse_cursor()

# Making Cursor visible using "mouse_visible" key which is assigned in Project Settings > Input Map
func show_mouse_cursor():
	if Input.is_action_just_pressed("mouse_visible"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func configure_level(total_collectibles: int):
	level_score = 0
	level_total = total_collectibles
	score = 0

func add_score():
	score += 1
	level_score += 1

func has_all_collectibles() -> bool:
	return level_score >= level_total

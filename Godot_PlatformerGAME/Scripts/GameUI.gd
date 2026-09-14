extends Control

# ---------- VARIABLES ---------- #

@onready var coinsLabel = $CoinsLabel

# ---------- FUNCTIONS ---------- #

func _process(_delta):
	coinsLabel.text = "x %d / %d" % [GameManager.score, GameManager.level_total]

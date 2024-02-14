extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().paused == true:
		get_tree().paused = false



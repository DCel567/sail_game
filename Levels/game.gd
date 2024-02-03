extends Node2D

@onready var level1 = preload("res://Levels/level1.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().change_scene_to_packed(level1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

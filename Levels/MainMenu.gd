extends CanvasLayer

var l = preload("res://Levels/level1.tscn").instantiate()
#@onready var level1 = preload("res://Levels/level1.tscn").instantiate()

func _ready():
	if get_tree().paused == true:
		get_tree().paused = false


func _on_button_control_up():
	print("up caught")
	get_tree().change_scene_to_file("res://Levels/level1.tscn")

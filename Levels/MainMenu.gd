extends CanvasLayer

var l = preload("res://Levels/level1.tscn").instantiate()
#@onready var level1 = preload("res://Levels/level1.tscn").instantiate()

func _ready():
	if get_tree().paused == true:
		get_tree().paused = false


func _on_start_button_up():
	print("start up caught")
	get_tree().change_scene_to_file("res://Levels/level1.tscn")


func _on_exit_button_up():
	print("exit up cought")
	get_tree().quit()

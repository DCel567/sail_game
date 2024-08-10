extends CanvasLayer

#var l = preload("res://Levels/level1.tscn").instantiate()
#@onready var level1 = preload("res://Levels/level1.tscn").instantiate()

func _ready():
	if get_tree().paused == true:
		get_tree().paused = false


func _on_start_button_up():
	get_tree().change_scene_to_file("res://Levels/R1L1.tscn")


func _on_level_button_up():
	get_tree().change_scene_to_file("res://Levels/LevelSelectMenu.tscn")

func _on_exit_button_up():
	get_tree().quit()

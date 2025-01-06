extends CanvasLayer


func _ready():
	if get_tree().paused == true:
		get_tree().paused = false


func _on_start_button_up():
	get_tree().change_scene_to_file("res://Levels/Region1/R1L1.tscn")


func _on_level_button_up():
	get_tree().change_scene_to_file("res://Levels/Menus/LevelSelectMenu.tscn")

func _on_exit_button_up():
	get_tree().quit()


func _on_fullscreen_button_up():
	var mode := DisplayServer.window_get_mode()
	var is_window: bool = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if is_window else DisplayServer.WINDOW_MODE_WINDOWED)


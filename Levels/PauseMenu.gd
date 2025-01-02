extends CanvasLayer

var paused : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		hide()
		get_tree().paused = false
	else:
		get_tree().paused = true
		show()
		
	paused = !paused


func _on_exit_button_up():
	get_tree().quit()


func _on_menu_button_up():
	get_tree().change_scene_to_file("res://Levels/MainMenu.tscn")


func _on_continue_button_up():
	pauseMenu()


func _on_fullscreen_button_up():
	var mode := DisplayServer.window_get_mode()
	var is_window: bool = mode != DisplayServer.WINDOW_MODE_FULLSCREEN
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if is_window else DisplayServer.WINDOW_MODE_WINDOWED)

extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_first_level_up():
	get_tree().change_scene_to_file("res://Levels/level1.tscn")



func _on_back_button_up():
	get_tree().change_scene_to_file("res://Levels/MainMenu.tscn")

extends Control

@export var label_color_normal: Color
@export var label_color_hover: Color
@export var border_color_normal: Color
@export var border_color_hover: Color

var tween: Tween
@onready var colors = $ButtonControl/StartButton/Colors


func start_hover_on() -> void:
	if tween and tween.is_running():
		tween.kill()
	tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	
	var idx: int = 0
	for c in colors.get_children():
		tween.parallel().tween_property(c, "position:y", 0.0, 0.3 + idx * randf_range(0.08, 0.15))
		idx += 1
	
func start_hover_off() -> void:
	if tween and tween.is_running():
		tween.kill()
	tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	
	for i in range(colors.get_child_count()-1, -1, -1):
		var c = colors.get_child(i)
		tween.parallel().tween_property(c, "position:y", c.size.y, 0.7 - i * randf_range(0.08, 0.15))



func _on_start_button_mouse_entered():
	start_hover_on()


func _on_start_button_mouse_exited():
	start_hover_off()

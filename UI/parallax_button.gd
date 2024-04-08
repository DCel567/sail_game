extends Control

signal down
signal up
signal prsd

@export var label_color_normal: Color
@export var label_color_hover: Color

@export var label: String

var tween: Tween

@onready var colors = $StartButton/Colors
@onready var _label = $StartButton/Label
@onready var _panel = $Panel

func _ready():
	_label.text = label

func start_hover_on() -> void:
	if tween and tween.is_running():
		tween.kill()
	tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	
	var idx: int = 0
	for c in colors.get_children():
		tween.parallel().tween_property(c, "position:y", 0.0, 0.3 + idx * randf_range(0.08, 0.15))
		idx += 1
		
	tween.parallel().tween_property(_label, "self_modulate", label_color_hover, 0.4)

	
func start_hover_off() -> void:
	if tween and tween.is_running():
		tween.kill()
	tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	
	for i in range(colors.get_child_count()-1, -1, -1):
		var c = colors.get_child(i)
		tween.parallel().tween_property(c, "position:y", c.size.y, 0.8 - i * randf_range(0.08, 0.15))
		
	tween.parallel().tween_property(_label, "self_modulate", label_color_normal, 0.85)


func _on_start_button_mouse_entered():
	start_hover_on()


func _on_start_button_mouse_exited():
	start_hover_off()


func _on_start_button_button_down():
	emit_signal("down")


func _on_start_button_button_up():
	emit_signal("up")


func _on_start_button_pressed():
	emit_signal("prsd")

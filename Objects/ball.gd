extends Area2D
class_name CannonBall

@export var live_time = 2
var time_lived = 0

var pos_x_to

func _ready():
	position.y -= 550
	
	var scale_tween = get_tree().create_tween()
	scale_tween.tween_property(self, "scale", Vector2(0.1, 0.1), live_time).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	
	var pos_y_tween = get_tree().create_tween()
	pos_y_tween.tween_property(self, "position:y", position.y - 400, live_time/2).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	pos_y_tween.tween_property(self, "position:y", position.y, live_time/2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)

	var pos_x_tween = get_tree().create_tween()
	pos_x_tween.tween_property(self, "position:x", pos_x_to, live_time).set_trans(Tween.TRANS_LINEAR)

func _process(delta):
	time_lived += delta

	if time_lived > 1 and has_overlapping_areas():
		get_overlapping_areas()[0].hit()
		queue_free()

	if time_lived > live_time:
		queue_free()


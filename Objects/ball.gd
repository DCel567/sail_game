extends Area2D

@export var live_time = 2
var time_lived = 0

func _ready():
	position.y -= 550
	
	var scale_tween = get_tree().create_tween()
	scale_tween.tween_property(self, "scale", Vector2(0.1, 0.1), live_time).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	
	var pos_tween = get_tree().create_tween()
	pos_tween.tween_property(self, "position:y", position.y - 400, live_time/2).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	pos_tween.tween_property(self, "position:y", position.y, live_time/2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)


func _process(delta):
	time_lived += delta
	
	if time_lived > 1 and has_overlapping_areas():
		get_overlapping_areas()[0].hit()
		
	if time_lived > live_time:
		queue_free()
	

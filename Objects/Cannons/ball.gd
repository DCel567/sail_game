extends Area2D
class_name CannonBall

@export var live_time = 2
var time_lived = 0
var pos_x_to

var scale_tween: Tween
var pos_y_tween: Tween
var pos_x_tween: Tween

func _ready():
	position.y -= 550
	create_tweens()
	
func create_tweens():
	# Создаем твин для масштаба
	scale_tween = create_tween()
	scale_tween.tween_property(self, "scale", Vector2(0.1, 0.1), live_time) \
		.set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	
	# Создаем твин для движения по Y (парабола)
	pos_y_tween = create_tween()
	pos_y_tween.tween_property(self, "position:y", position.y - 400, live_time/2.0) \
		.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	pos_y_tween.tween_property(self, "position:y", position.y, live_time/2.0) \
		.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	
	# Создаем твин для движения по X
	pos_x_tween = create_tween()
	pos_x_tween.tween_property(self, "position:x", pos_x_to, live_time) \
		.set_trans(Tween.TRANS_LINEAR)


func _process(delta):
	time_lived += delta

	if (time_lived > (float(live_time) / 2)) and has_overlapping_areas():
		get_overlapping_areas()[0].hit()
		explode()
		return

	if time_lived > live_time:
		explode()
		
func explode():
	if scale_tween and scale_tween.is_valid():
		scale_tween.kill()
	if pos_y_tween and pos_y_tween.is_valid():
		pos_y_tween.kill()
	if pos_x_tween and pos_x_tween.is_valid():
		pos_x_tween.kill()
		
	queue_free()


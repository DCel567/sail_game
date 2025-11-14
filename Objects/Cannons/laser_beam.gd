extends Area2D
class_name LaserBeam

@export var live_time = 2
var time_lived = 0

var pos_x_to


func _ready():
	position.y -= 550


func _process(delta):
	time_lived += delta

	if time_lived > 1 and has_overlapping_areas():
		get_overlapping_areas()[0].hit()
		queue_free()

	if time_lived > live_time:
		queue_free()

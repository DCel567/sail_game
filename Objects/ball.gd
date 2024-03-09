extends Area2D

@onready var time = -100
@onready var ftime = 1
@export var live_time = 5

func _ready():
	position.y -= 550
	await get_tree().create_timer(live_time).timeout
	queue_free()


func _process(delta):
	time += 100*delta
	ftime += delta
	
	#var scale_delta = 1.5 - 0.1 * ftime
	
	position.y += 0.2 * time
	
	$".".scale /= 1.015
	# y = y0 + 0.2*t


	

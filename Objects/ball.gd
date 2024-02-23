extends Area2D

@onready var time = 100

func _ready():
	position.y -= 550


func _process(delta):
	time -= 100*delta
	
	$".".scale /= 1.015
	position.y -= 0.2*(time)

	

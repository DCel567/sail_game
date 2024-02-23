extends Area2D

signal player_shoot

@export var freq = 1.5
@export var ampl = 0.4
@export var rot_ampl = 0.001

@onready var time = 0


func _process(delta):
	if Input.is_action_just_pressed("shot"):
		player_shoot.emit()

	

func _physics_process(delta):
	time += delta*freq 
	$".".position.y += ampl*sin(PI/2 + time)
	$".".rotation += rot_ampl*sin(PI/2 + 2*time)

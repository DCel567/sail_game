extends Area2D

signal player_shoot

@export var freq = 1.5
@export var ampl = 0.4
@export var rot_ampl = 0.001

@export var fire_rate = 0.5

@onready var time = 0
var can_shoot = true


func _process(delta):
	if can_shoot and Input.is_action_just_pressed("shot"):
		player_shoot.emit()
		can_shoot = false
		await get_tree().create_timer(1/fire_rate).timeout
		can_shoot = true


func _physics_process(delta):
	time += delta*freq 
	$".".position.y += ampl*sin(PI/2 + time)
	$".".rotation += rot_ampl*sin(PI/2 + 2*time)

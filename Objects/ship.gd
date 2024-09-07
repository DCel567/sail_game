extends Area2D

signal player_shoot(cannon_pos: Vector2)

@export var freq = 1.5
@export var ampl = 0.4
@export var rot_ampl = 0.001

@export var fire_rate = [0.5, 0.5]

@onready var time = 0
var can_shoot = [true, true]
var active_cannon = 0  # 0 or 1 to shoot left or right cannon


func _process(_delta):
	var ball_y_delta = 487
	
	if can_shoot[active_cannon] and Input.is_action_just_pressed("shot"):
		active_cannon = (active_cannon + 1) % 2
		var marker_pos = ($Cannons.get_child(active_cannon)).global_position
		marker_pos.y += ball_y_delta
		player_shoot.emit(marker_pos)
		can_shoot[active_cannon] = false
		await get_tree().create_timer(1/fire_rate[active_cannon]).timeout
		can_shoot[active_cannon] = true


func _physics_process(delta):
	time += delta*freq
	$".".position.y += ampl*sin(PI/2 + time)
	$".".rotation += rot_ampl*sin(PI/2 + 2*time)

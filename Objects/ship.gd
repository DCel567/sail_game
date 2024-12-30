extends Area2D

signal player_shoot(cannon_pos: Vector2)

@export var freq = 1.5
@export var ampl = 0.4
@export var rot_ampl = 0.001

@export var fire_rate = [0.5, 0.5]

@onready var time = 0
var can_shoot = [true, true]
var active_cannon = 0  # 0 or 1 to shoot left or right cannon


func _ready():
	$Cannons/CannonMark.position = $Cannons.get_child(active_cannon).position
	

func _process(_delta):
	if can_shoot[active_cannon] and Input.is_action_just_pressed("shot"):
		shoot()
	if Input.is_action_just_pressed("swap_cannon"):
		swap_cannon()

func swap_cannon():
	active_cannon = (active_cannon+1) % 2
	$Cannons/CannonMark.position = $Cannons.get_child(active_cannon).position

func _physics_process(delta):
	time += delta*freq
	$".".position.y += ampl*sin(PI/2 + time)
	$".".rotation += rot_ampl*sin(PI/2 + 2*time)


func cannon_await(cannon_num):
	can_shoot[cannon_num] = false
	await get_tree().create_timer(1/fire_rate[cannon_num]).timeout
	can_shoot[cannon_num] = true


func shoot():
	var ball_y_delta = 487
	var marker_pos = ($Cannons.get_child(active_cannon)).global_position
	
	marker_pos.y += ball_y_delta
	player_shoot.emit(marker_pos)
	
	cannon_await(active_cannon)
	swap_cannon()


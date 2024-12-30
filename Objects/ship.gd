extends Area2D

signal player_shoot(cannon_pos: Vector2)

@export var freq = 1.5
@export var ampl = 0.4
@export var rot_ampl = 0.001

@onready var time = 0

var installed_cannons = []

var active_cannon = 0  # 0 or 1 to shoot left or right cannon


func _ready():
	var cannon_one = Cannon.new($Cannons/Cannon1.global_position)
	installed_cannons.append(cannon_one)
	
	var cannon_two = Cannon.new($Cannons/Cannon2.global_position)
	installed_cannons.append(cannon_two)
	
	$Cannons/CannonMark.position = $Cannons.get_child(active_cannon).position
	

func _process(_delta):
	if installed_cannons[active_cannon].can_shoot and Input.is_action_just_pressed("shot"):
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
	installed_cannons[cannon_num].can_shoot = false
	await get_tree().create_timer(1/installed_cannons[cannon_num].fire_rate).timeout
	installed_cannons[cannon_num].can_shoot = true


func shoot():
	var ball_y_delta = 487
	var marker_pos = ($Cannons.get_child(active_cannon)).global_position
	
	marker_pos.y += ball_y_delta
	player_shoot.emit(marker_pos)
	
	cannon_await(active_cannon)
	swap_cannon()


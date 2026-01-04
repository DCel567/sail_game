extends Area2D

signal player_shoot(cannon_pos: Vector2)
signal cannon_switch(cannon_num: int)

@export var freq = 1.5
@export var ampl = 0.4
@export var rot_ampl = 0.001

@export var cannon_autoswap = false

@onready var time = 0

var installed_cannons = []
var alt_cannons = []
var active_cannon = 0  # 0 or 1 to shoot left or right cannon
var cannon_types_amount = 2


func _ready():
	var cannon_one_pos = $Cannons/Cannon1.global_position
	var cannon_one = Cannon.new(cannon_one_pos, 1)
	installed_cannons.append(cannon_one)
	installed_cannons[0].current_cannon = true
	
	var cannon_two_pos = $Cannons/Cannon2.global_position
	var cannon_two = Cannon.new(cannon_two_pos, 1)
	installed_cannons.append(cannon_two)
	installed_cannons[1].current_cannon = true
	
	$Cannons/CannonMark.position = $Cannons.get_child(active_cannon).position
	
	var alt_cannon_one = Cannon.new(cannon_one_pos, 2)
	alt_cannons.append(alt_cannon_one)
	
	var alt_cannon_two = Cannon.new(cannon_two_pos, 1)
	alt_cannons.append(alt_cannon_two)
	

func _process(_delta):
	#TODO: rewrite it using signals
	if installed_cannons[active_cannon].can_shoot:
		$Cannons/CannonMark.make_blue()
	else:
		$Cannons/CannonMark.make_gray()
	
	if installed_cannons[active_cannon].can_shoot and Input.is_action_just_pressed("shot"):
		shoot()
	if Input.is_action_just_pressed("swap_cannon"):
		swap_cannon()
	if Input.is_action_just_pressed("change_cannon_type"):
		change_cannon_type()

func swap_cannon():
	active_cannon = (active_cannon+1) % 2
	$Cannons/CannonMark.position = $Cannons.get_child(active_cannon).position
	
func change_cannon_type():
	var tmp = installed_cannons[active_cannon]
	installed_cannons[active_cannon] = alt_cannons[active_cannon]
	alt_cannons[active_cannon] = tmp
	
	cannon_switch.emit(active_cannon)


func _physics_process(delta):
	time += delta*freq
	$".".position.y += ampl*sin(PI/2 + time)
	$".".rotation += rot_ampl*sin(PI/2 + 2*time)


func shoot():
	var ball_y_delta = 487
	var marker_pos = ($Cannons.get_child(active_cannon)).global_position
	
	marker_pos.y += ball_y_delta
	player_shoot.emit(marker_pos, installed_cannons[active_cannon].cannon_type)
	
	installed_cannons[active_cannon].reload()
	if cannon_autoswap:
		swap_cannon()


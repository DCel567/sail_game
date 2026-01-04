extends Node2D
class_name Level

var cannonball : PackedScene = preload("res://Objects/Cannons/ball.tscn")
var laserbeam : PackedScene = preload("res://Objects/Cannons/laser_beam.tscn")
var octopus_enemy : PackedScene = preload("res://Objects/Enemies/octopus.tscn")
var ufo_enemy : PackedScene = preload("res://Objects/Enemies/ufo.tscn")

var enemy_queue = []

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().paused == true:
		get_tree().paused = false
	
	enemy_queue = $sea/Enemies.enemies
	_on_enemy_dead()
	
	$CannonIcon1.activate()
	$CannonIcon2.activate()


func _on_ship_player_shoot(ball_pos: Vector2, ball_type: int):
	var ball
	if ball_type == 1:
		ball = cannonball.instantiate() as CannonBall
	else:
		ball = laserbeam.instantiate() as LaserBeam
	ball.pos_x_to = ($sea/ship.position.x - ball_pos.x)*4/5 + ball_pos.x
	
	ball.position = ball_pos
	$sea/Projectiles.add_child(ball)


func _on_enemy_dead():
	if len(enemy_queue) > 0:
		var new_enemy = null
		
		var enemy_id = enemy_queue.pop_back()
		if enemy_id == 1:
			new_enemy = octopus_enemy.instantiate()
		if enemy_id == 2:
			new_enemy = ufo_enemy.instantiate()
		$sea/Enemies.add_child(new_enemy)
		new_enemy.on_death.connect(_on_enemy_dead)
	else:
		get_tree().change_scene_to_file("res://Levels/Menus/WinScreen.tscn")


func _on_ship_cannon_switch(cannon_num):
	if cannon_num == 0:
		if $CannonIcon1.activated:
			$CannonIcon1.deactivate()
			$AltCannonIcon1.activate()
		else:
			$CannonIcon1.activate()
			$AltCannonIcon1.deactivate()
			
	if cannon_num == 1:
		if $CannonIcon2.activated:
			$CannonIcon2.deactivate()
			$AltCannonIcon2.activate()
		else:
			$CannonIcon2.activate()
			$AltCannonIcon2.deactivate()

extends Node2D
class_name Level

var cannonball : PackedScene = preload("res://Objects/ball.tscn")
var octopus_enemy : PackedScene = preload("res://Objects/octopus.tscn")
var ufo_enemy : PackedScene = preload("res://Objects/ufo.tscn")

var enemy_queue = []

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().paused == true:
		get_tree().paused = false
	
	enemy_queue = $sea/Enemies.enemies
	_on_enemy_dead()


func _on_ship_player_shoot(ball_pos: Vector2):
	var ball = cannonball.instantiate() as CannonBall
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
		get_tree().change_scene_to_file("res://Levels/WinScreen.tscn")
		print("you win!")
	

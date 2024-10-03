extends Node2D
class_name Level

var cannonball : PackedScene = preload("res://Objects/ball.tscn")
var first_enemy : PackedScene = preload("res://Objects/octopus.tscn")
var enemy_queue = []

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().paused == true:
		get_tree().paused = false
	
	enemy_queue = $sea/Enemies.enemies
	_on_enemy_dead()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_ship_player_shoot(ball_pos: Vector2):
	var ball = cannonball.instantiate() as Area2D
	
	ball.position = ball_pos
	$sea/Projectiles.add_child(ball)
	
func _on_enemy_dead():
	if len(enemy_queue) > 0:
		var new_enemy = null
		if enemy_queue.pop_back() == 1:
			new_enemy = first_enemy.instantiate()
		$sea/Enemies.add_child(new_enemy)
		new_enemy.on_death.connect(_on_enemy_dead)
	else:
		print("you win!")
	

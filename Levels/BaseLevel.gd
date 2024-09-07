extends Node2D
class_name Level

var cannonball : PackedScene = preload("res://Objects/ball.tscn") 

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().paused == true:
		get_tree().paused = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_ship_player_shoot(ball_pos: Vector2):
	var ball = cannonball.instantiate() as Area2D
	
	#ball.position = $sea/ship.position
	ball.position = ball_pos
	$sea/Projectiles.add_child(ball)
	

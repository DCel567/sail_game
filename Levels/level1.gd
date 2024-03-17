extends Node2D

var cannonball : PackedScene = preload("res://Objects/ball.tscn") 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ship_player_shoot():
	var ball = cannonball.instantiate() as Area2D
	
	ball.position = $sea/ship.position
	$sea/Projectiles.add_child(ball)
	

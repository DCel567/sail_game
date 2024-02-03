extends Node2D

@export var freq = 10
@export var ampl = 20

var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
	
func _physics_process(delta):
	time += delta*freq 
	$Node2D.position.x = ampl*sin(time)


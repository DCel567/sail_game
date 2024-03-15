extends Node2D

@export var freq = 2
@export var ampl = 60
@export var offset = 0

@onready var time = offset


func _ready():
	pass

func _process(_delta):
	pass
	
	
func _physics_process(delta):
	time += delta*freq 
	$Node2D.position.x = ampl*sin(time)


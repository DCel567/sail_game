extends Marker2D
class_name Cannon

@export var fire_rate = 0.5
@export var can_shoot = true
var cannon_type = 1 # for simple cannon


func _init(pos, num):
	global_position = pos
	cannon_type = num

	
# Called when the node enters the scene tree for the first time.
func _ready():
	print("simpleCannon ready")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func reload(reload_in_background=true):
	can_shoot = false
	await Engine.get_main_loop().create_timer(1/fire_rate).timeout
	can_shoot = true

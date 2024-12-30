extends Marker2D
class_name Cannon

@export var fire_rate = 0.5
@export var can_shoot = true

# Called when the node enters the scene tree for the first time.
func _ready():
	print("simpleCannon ready")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

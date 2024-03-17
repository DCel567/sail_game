extends Area2D

@export var freq = 4
@export var ampl = 1200
@export var rot_ampl = 0.001

@onready var time = 0


func _ready():
	var tween = get_tree().create_tween().bind_node(self).set_loops()
	tween.tween_property(self, "position:x", position.x + ampl, freq).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position:x", position.x, freq).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	
	var tweeny = get_tree().create_tween().bind_node(self).set_loops()
	tweeny.tween_property(self, "position:y", position.y - 50, freq/4).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tweeny.tween_property(self, "position:y", position.y, freq/4).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

func _process(delta):
	pass

	

func _physics_process(delta):
	pass
	time += delta*1 
#
#	move_local_x(ampl * sin(time))
	rotation += rot_ampl*sin(PI/2 + 2*time)

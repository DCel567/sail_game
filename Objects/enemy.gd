extends Area2D
class_name Enemy

@export var freq = 4
@export var ampl = 1200
@export var rot_ampl = 0.001
@export var hp = 3

@onready var time = 0

signal on_death

func _ready():
	var tween = get_tree().create_tween().bind_node(self).set_loops()
	tween.tween_property(self, "position:x", position.x + ampl, freq).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position:x", position.x, freq).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	
	var tweeny = get_tree().create_tween().bind_node(self).set_loops()
	tweeny.tween_property(self, "position:y", position.y - 50, freq/4).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tweeny.tween_property(self, "position:y", position.y, freq/4).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

func _process(_delta):
	pass

func hit():
	hp -= 1
	if hp == 0:
		get_tree().queue_delete(self)
		on_death.emit()
	
	self.set_modulate(Color8(215, 54, 71))
	#self_modulate(Color8(215, 54, 71))
	await get_tree().create_timer(0.2).timeout
	self.set_modulate(Color(1, 1, 1, 1))
	

func _physics_process(delta):
	time += delta
	rotation += rot_ampl*sin(PI/2 + 2*time)

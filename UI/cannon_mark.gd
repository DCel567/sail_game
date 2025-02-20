extends Sprite2D

var cycle_time = 2.0
var gray_mat = material

func _ready():
	var pos_tween = get_tree().create_tween().set_loops()
	pos_tween.tween_property(self, "scale", Vector2(1.05, 1.05), cycle_time/2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	pos_tween.tween_property(self, "scale", Vector2(0.85, 0.85), cycle_time/2).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	
	var rot_tween = get_tree().create_tween().set_loops()
	rot_tween.tween_property(self, "rotation", 0.1, 2*cycle_time).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	rot_tween.tween_property(self, "rotation", -0.1, 2*cycle_time).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	
	make_blue()
	
func make_blue():
	material = Material.new()
	
func make_gray():
	material = gray_mat

func _process(_delta):
	pass

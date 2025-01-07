extends Sprite2D

var activate_time = 0.5
var init_pos = position

var activated = false

# Called when the node enters the scene tree for the first time.
func _ready():
	init_pos = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func activate():
	var tween = get_tree().create_tween().bind_node(self)
	tween.tween_property(self, "position:x", get_window().size.x/28, activate_time).set_trans(Tween.TRANS_SINE)
	activated = true
	
func deactivate():
	var tween = get_tree().create_tween().bind_node(self)
	tween.tween_property(self, "position:x", init_pos.x, activate_time).set_trans(Tween.TRANS_SINE)
	activated = false

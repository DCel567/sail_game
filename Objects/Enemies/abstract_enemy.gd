extends Area2D
class_name AbsEnemy

@export var hp: int = 3

signal on_death

func move() -> void:
	assert(false, "move() should be overwritten in descendant.")


func _ready():
	move()

func _create_tweens() -> void:
	assert(false, "_create_tweens() should be overwritten in descendant.")
	
func _exit_tree() -> void:
	assert(false, "_exit_tree() should be overwritten in descendant.")
	
#TODO: variable amount of damage
func hit() -> void:
	hp -= 1
	
	_play_hit_effect()
	
	if hp <= 0:
		die()

func _play_hit_effect() -> void:
	self.set_modulate(Color8(215, 54, 71))
	await get_tree().create_timer(0.2).timeout
	self.set_modulate(Color(1, 1, 1, 1))
	
func die() -> void:
	on_death.emit()
	#TODO: check what's better:
	#queue_free()
	get_tree().queue_delete(self)
	

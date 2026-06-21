extends Node3D

@export var escena: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var lifetime = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lifetime -= delta
	if lifetime <= 0: 
		spawner()
		lifetime = 10
	pass
	
func spawner():
	var new_enemigo : Node3D = escena.instantiate()
	new_enemigo.position = global_position
	get_tree().root.add_child(new_enemigo)
	pass

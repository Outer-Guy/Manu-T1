class_name hurtbox
extends Area3D

var ListaIgnorar : Array [Node3D]
var lifetime : float = 0

const hurtboxScene : PackedScene = preload("res://escenas/hurtbox.tscn")

static func _new_hurt_box(new_position : Vector3, body: Node3D, new_lifetime : float) -> Node3D:
	var new_hurtbox : Node3D = hurtboxScene.instantiate()
	new_hurtbox.ListaIgnorar.apend(body)
	new_hurtbox.position = new_position
	new_hurtbox.lifetime = new_lifetime
	
	print("spawn: ", new_position)
	return new_hurtbox
	
func _psysics_process(delta: float) -> void:
		lifetime -= delta
		if lifetime <= 0:
			queue_free() 
		
func _on_body_entered(body: Node3D) -> void:
	for node in ListaIgnorar:
		if(node == body):
			return
	print(body)
	body.queve_free()
	pass # Replace with function body.
	

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _squirrel() -> void:
	var newSquirrel = get_node("/root/Node2D/Squirrel").duplicate()
	RandomSpawn(newSquirrel)
	pass # Replace with function body.


func _hedgehog() -> void:
	var newHedgehog = get_node("/root/Node2D/Hedgehog").duplicate()
	RandomSpawn(newHedgehog)
	pass # Replace with function body.


func _bunny() -> void:
	var newBunny = get_node("/root/Node2D/Bunny").duplicate()
	RandomSpawn(newBunny)
	pass # Replace with function body.

func RandomSpawn(animal):
	var max = 1000
	var min = 400
	var height = 230
	
	animal.position = Vector2(randi_range(400, 1000), 230)
	add_child(animal)

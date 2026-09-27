extends TileMapLayer


@onready var cam = get_viewport().get_camera_2d()

var currentDepth = 0

func _ready() -> void:
	GenerateChunk()


func GenerateChunk():
	for yLevel in range(1 + currentDepth, 50 + currentDepth):
		for xLevel in 18:
			var randomNumber = randi() % 20
			if randomNumber < 2:
				set_cell(Vector2i(xLevel, yLevel), 0, Vector2i(0,0))
			elif randomNumber == 2:
				set_cell(Vector2i(xLevel, yLevel), 1, Vector2i(0,0))
		currentDepth = yLevel

func _input(event):
	if event.is_action_pressed("ScrollDown"):
		if cam.position.y >= (currentDepth - 30) * 64:
			GenerateChunk()
	elif event.is_action_pressed("ScrollUp"):
		pass

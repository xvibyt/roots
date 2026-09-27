extends TileMapLayer




@onready var SelectedRootID: int = 2

func _ready() -> void:
	set_cell(Vector2i(7, 0), 0, Vector2i(0,1))
	set_cell(Vector2i(8, 0), 0, Vector2i(1,1))
	set_cell(Vector2i(9, 0), 0, Vector2i(2,1))
	set_cell(Vector2i(10, 0), 0, Vector2i(3,1))
	
	set_cell(Vector2i(8, -1), 0, Vector2i(1,0))
	set_cell(Vector2i(9, -1), 0, Vector2i(2,0))


func _process(delta: float) -> void:
	var pos = to_local(get_global_mouse_position())
	var cell = local_to_map(pos)
	var posCenter = to_global(map_to_local(cell))
	var sel = get_node("/root/Node2D/Selected")
	sel.position = posCenter
	
	
func _unhandled_input(event):
	if event.is_action_pressed("Click"):
		var pos = to_local(get_global_mouse_position())
		var cell = local_to_map(pos)
		var surrounding = get_surrounding_cells(cell)
		var i = 0
		var allowed = false
		for surCell in surrounding:
			i+=1
			if get_cell_source_id(surCell) >= 0:
				if SelectedRootID == 2: #up-down
					if i == 4:
						if get_cell_source_id(surCell) == 0 or get_cell_source_id(surCell) == 2 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 6 or get_cell_source_id(surCell) == 7:
							allowed = true
					pass
				elif SelectedRootID == 3: #left-right
					if i == 1:
						if get_cell_source_id(surCell) == 3 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 5 or get_cell_source_id(surCell) == 7 or get_cell_source_id(surCell) == 9:
							allowed = true
					elif i == 3:
						if get_cell_source_id(surCell) == 3 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 5 or get_cell_source_id(surCell) == 6 or get_cell_source_id(surCell) == 8:
							allowed = true
					pass
				elif SelectedRootID == 4: #up-down-left-right
					if i == 1:
						if get_cell_source_id(surCell) == 3 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 5 or get_cell_source_id(surCell) == 7 or get_cell_source_id(surCell) == 9:
							allowed = true
					elif i == 3:
						if get_cell_source_id(surCell) == 3 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 5 or get_cell_source_id(surCell) == 6 or get_cell_source_id(surCell) == 8:
							allowed = true
					elif i == 4:
						if get_cell_source_id(surCell) == 0 or get_cell_source_id(surCell) == 2 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 6 or get_cell_source_id(surCell) == 7:
							allowed = true
					pass
				elif SelectedRootID == 5: #up-left-right
					if i == 1:
						if get_cell_source_id(surCell) == 3 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 5 or get_cell_source_id(surCell) == 7 or get_cell_source_id(surCell) == 9:
							allowed = true
					elif i == 3:
						if get_cell_source_id(surCell) == 3 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 5 or get_cell_source_id(surCell) == 6 or get_cell_source_id(surCell) == 8:
							allowed = true
					elif i == 4:
						if get_cell_source_id(surCell) == 0 or get_cell_source_id(surCell) == 2 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 6 or get_cell_source_id(surCell) == 7:
							allowed = true
					pass
				elif SelectedRootID == 6: #up-down-right
					if i == 1:
						if get_cell_source_id(surCell) == 3 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 5 or get_cell_source_id(surCell) == 7 or get_cell_source_id(surCell) == 9:
							allowed = true
					elif i == 4:
						if get_cell_source_id(surCell) == 0 or get_cell_source_id(surCell) == 2 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 6 or get_cell_source_id(surCell) == 7:
							allowed = true
					pass
				elif SelectedRootID == 7: #up-down-left
					if i == 3:
						if get_cell_source_id(surCell) == 3 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 5 or get_cell_source_id(surCell) == 6 or get_cell_source_id(surCell) == 8:
							allowed = true
					elif i == 4:
						if get_cell_source_id(surCell) == 0 or get_cell_source_id(surCell) == 2 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 6 or get_cell_source_id(surCell) == 7:
							allowed = true
					pass
				elif SelectedRootID == 8: #up-right
					if i == 1:
						if get_cell_source_id(surCell) == 3 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 5 or get_cell_source_id(surCell) == 7 or get_cell_source_id(surCell) == 9:
							allowed = true
					elif i == 4:
						if get_cell_source_id(surCell) == 0 or get_cell_source_id(surCell) == 2 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 6 or get_cell_source_id(surCell) == 7:
							allowed = true
					pass
				elif SelectedRootID == 9: #up-left
					if i == 3:
						if get_cell_source_id(surCell) == 3 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 5 or get_cell_source_id(surCell) == 6 or get_cell_source_id(surCell) == 8:
							allowed = true
					elif i == 4:
						if get_cell_source_id(surCell) == 0 or get_cell_source_id(surCell) == 2 or get_cell_source_id(surCell) == 4 or get_cell_source_id(surCell) == 6 or get_cell_source_id(surCell) == 7:
							allowed = true
					pass
		
		if allowed == true and get_cell_source_id(cell) < 0:
			print("place")
			set_cell(cell, SelectedRootID, Vector2i(0,0))
		


func _on_sel_one_pressed() -> void:
	var ran = randi_range(2, 9)
	SelectedRootID = ran

	if ran == 2:
		get_node("/root/Node2D/Control/SelOne").icon = load("res://roots/A1.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/A1.png")

	elif ran == 3:
		get_node("/root/Node2D/Control/SelOne").icon = load("res://roots/A2.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/A2.png")

	elif ran == 4:
		get_node("/root/Node2D/Control/SelOne").icon = load("res://roots/B1.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/B1.png")

	elif ran == 5:
		get_node("/root/Node2D/Control/SelOne").icon = load("res://roots/C1.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/C1.png")

	elif ran == 6:
		get_node("/root/Node2D/Control/SelOne").icon = load("res://roots/C2.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/C2.png")

	elif ran == 7:
		get_node("/root/Node2D/Control/SelOne").icon = load("res://roots/C3.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/C3.png")

	elif ran == 8:
		get_node("/root/Node2D/Control/SelOne").icon = load("res://roots/D2.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/D2.png")

	elif ran == 9:
		get_node("/root/Node2D/Control/SelOne").icon = load("res://roots/D1.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/D1.png")


func _on_sel_two_pressed() -> void:
	var ran = randi_range(2, 9)
	SelectedRootID = ran

	if ran == 2:
		get_node("/root/Node2D/Control/SelTwo").icon = load("res://roots/A1.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/A1.png")

	elif ran == 3:
		get_node("/root/Node2D/Control/SelTwo").icon = load("res://roots/A2.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/A2.png")

	elif ran == 4:
		get_node("/root/Node2D/Control/SelTwo").icon = load("res://roots/B1.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/B1.png")

	elif ran == 5:
		get_node("/root/Node2D/Control/SelTwo").icon = load("res://roots/C1.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/C1.png")

	elif ran == 6:
		get_node("/root/Node2D/Control/SelTwo").icon = load("res://roots/C2.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/C2.png")

	elif ran == 7:
		get_node("/root/Node2D/Control/SelTwo").icon = load("res://roots/C3.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/C3.png")

	elif ran == 8:
		get_node("/root/Node2D/Control/SelTwo").icon = load("res://roots/D2.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/D2.png")

	elif ran == 9:
		get_node("/root/Node2D/Control/SelTwo").icon = load("res://roots/D1.png")
		get_node("/root/Node2D/Selected").texture = load("res://roots/D1.png")

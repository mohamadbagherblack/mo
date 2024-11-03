@tool
extends Line2D

@export var pos2:Vector2
@export var exclude_zone:bool
@export var Exclude_pos1:Vector2
@export var Exclude_pos2:Vector2

func _ready() -> void:
	if not Engine.is_editor_hint():
		visible = false
		$"forbidden zone".visible = false
func _process(delta: float) -> void:
	$pos2.position = pos2
	
	set_point_position(0,Vector2.ZERO)
	set_point_position(1,Vector2($pos2.position.x,0))
	set_point_position(2,Vector2($pos2.position.x,$pos2.position.y))
	set_point_position(3,Vector2(0,$pos2.position.y))

	if exclude_zone:
		$"forbidden zone".visible = true
		$E_1.position = Exclude_pos1
		$E_2.position = Exclude_pos2
		$"forbidden zone".set_point_position(0,Vector2($E_1.position.x,$E_1.position.y))
		$"forbidden zone".set_point_position(1,Vector2($E_2.position.x,$E_1.position.y))
		$"forbidden zone".set_point_position(2,Vector2($E_2.position.x,$E_2.position.y))
		$"forbidden zone".set_point_position(3,Vector2($E_1.position.x,$E_2.position.y))
	else:
		$"forbidden zone".visible = false



func give_random_pos():
	if not exclude_zone:
		var x = randf_range(position.x,position.x + $pos2.position.x)
		var y = randf_range(position.y,position.y + $pos2.position.y)
		return(Vector2(x,y))
		print("dick")
	else:
		var x = randf_range(position.x,position.x + $pos2.position.x)
		var y = randf_range(position.y,position.y + $pos2.position.y)
		if x < position.x + $E_1.position.x or x > position.x + $E_2.position.x:
			return(Vector2(x,y))
		elif y < position.y + $E_1.position.y or y > position.y + $E_2.position.y:
			return(Vector2(x,y))
		else:
			return(position)



func _on_item_rect_changed() -> void:
	pass # Replace with function body.

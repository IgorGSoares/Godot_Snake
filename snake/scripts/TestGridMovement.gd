extends CharacterBody2D

const tile_size: Vector2 = Vector2(48,48)
var sprite_node_pos_tween: Tween #to move smooth
var direction: Vector2 = Vector2(0,-1)

func _physics_process(delta):
	_set_direction()
	
	if !sprite_node_pos_tween or !sprite_node_pos_tween.is_running():
		_move(direction)

func _set_direction():
	#if !sprite_node_pos_tween or !sprite_node_pos_tween.is_running(): #move only if tween is completed
	#if Input.is_action_pressed...
	
	if Input.is_action_just_pressed("Up") and !$up.is_colliding(): direction = Vector2(0,-1)
	if Input.is_action_just_pressed("Down") and !$down.is_colliding(): direction = Vector2(0,1)
	if Input.is_action_just_pressed("Left") and !$left.is_colliding(): direction = Vector2(-1,0)
	if Input.is_action_just_pressed("Right") and !$right.is_colliding(): direction = Vector2(1,0)

func _move(dir: Vector2):
	global_position += dir * tile_size
	$Sprite2D.global_position -= dir * tile_size # * speed = ?
	
	if sprite_node_pos_tween: sprite_node_pos_tween.kill()
	sprite_node_pos_tween = create_tween()
	sprite_node_pos_tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	sprite_node_pos_tween.tween_property($Sprite2D, "global_position", global_position, 0.350).set_trans(Tween.TRANS_SINE) #durantion = 0.185

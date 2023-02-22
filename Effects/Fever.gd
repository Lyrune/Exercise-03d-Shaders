extends Node2D

func start_fever():
	print("Fever Started!")
	fever()
	$Timer.start()
	var Fever_indicator = get_node_or_null("/root/Game/UI/HUD/Fever")
	if Fever_indicator != null:
		Fever_indicator.use_parent_material = false

func _on_Timer_timeout():
	if Global.feverish:
		fever()
		$Timer.start()
	else:
		var Fever_indicator = get_node_or_null("/root/Game/UI/HUD/Fever")
		if Fever_indicator != null:
			Fever_indicator.use_parent_material = true

func fever():
	var ball_container = get_node_or_null("/root/Game/Ball_Container")
	if ball_container != null:
		ball_container.make_ball_fever()
	var camera = get_node_or_null("/root/Game/Camera")
	if camera != null:
		camera.add_trauma(3.0)

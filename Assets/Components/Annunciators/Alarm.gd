extends Node3D

@onready var node_3d = $"/root/Node3D"

func _ready():
	while true:
		
		var alarm_active = not node_3d.alarm_groups["1"]["F"]
		var clear_alarm_active = not node_3d.alarm_groups["1"]["S"]
		
		var fast_alarm = get_node("Fast")
		var slow_alarm = get_node("Slow")
		#play/stop if needed
		if fast_alarm.playing != alarm_active:
			fast_alarm.playing = alarm_active
	
		if slow_alarm.playing != clear_alarm_active:
			slow_alarm.playing = clear_alarm_active
			
		
		
		await get_tree().create_timer(0.1).timeout
	

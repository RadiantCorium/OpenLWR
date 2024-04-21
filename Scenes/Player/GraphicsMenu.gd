extends Control


func _ready():
	set_occlusion_dropdown(get_node("Occlusion"))
	set_antialiasing_dropdown(get_node("Antialiasing"))
	var viewport = get_viewport()
	viewport.msaa_3d = 3
	viewport.use_taa = false
	viewport.use_occlusion_culling = true
	
#TODO: actually set graphics quality
func set_occlusion_dropdown(dropdown):
	dropdown.add_item("On")
	dropdown.add_item("Off")

func _new_occlusion_selected(index):
	var viewport = get_viewport()
	viewport.use_occlusion_culling = index == 1
	
func set_antialiasing_dropdown(dropdown):
	dropdown.add_item("MSAA 8x")
	dropdown.add_item("MSAA 4x")
	dropdown.add_item("TAA")
	dropdown.add_item("DISABLED")

func _new_antialiasing_selected(index):
	var viewport = get_viewport()
	if index == 1:
		viewport.msaa_3d = 3
		viewport.use_taa = false
	elif index == 2:
		viewport.msaa_3d = 2
		viewport.use_taa = false
	elif index == 3:
		viewport.msaa_3d = 0
		viewport.use_taa = true
	elif index == 4:
		viewport.msaa_3d = 0
		viewport.use_taa = false

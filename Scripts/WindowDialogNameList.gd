extends WindowDialog


func _on_ButtonOpen_button_down():
	pass # Replace with function body.


func _on_ButtonDelete_button_down():
	var dir = Directory.new()
	var plant_name = ProgrammManager.name_list_pressed_name
	var file_path = "user://Plants/" + plant_name + ".tres"
	dir.remove(file_path)
	get_parent().draw_buttons()
	hide()


func _on_ButtonCancle_button_down():
	hide()

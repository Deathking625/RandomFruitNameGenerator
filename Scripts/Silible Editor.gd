extends Control

var file_data = FileManager.load_file()

onready var line_edit = $VBoxContainer/VBoxContainer/LineEdit
onready var text_label = $VBoxContainer/VBoxContainer/InfoText


func _on_BackButton_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/MainPage.tscn")


func _on_AddStartButton_button_down():
	if file_data.start.find(line_edit.text) == -1:
		if line_edit.text != "":
			file_data.start.append(line_edit.text)
			file_data.start.sort()
			FileManager.save_file(file_data)
			text_label.text = "Startsilbe Gespeichert: " + line_edit.text
		else:
			text_label.text = "Leer - Nicht Gespeichert!"
	else:
		text_label.text = "Bereits vorhanden - Nicht Gespeichert!"
	line_edit.text = ""


func _on_AddMidButton_button_down():
	if file_data.mid.find(line_edit.text) == -1:
		if line_edit.text != "":
			file_data.mid.append(line_edit.text)
			file_data.mid.sort()
			FileManager.save_file(file_data)
			text_label.text = "Mittelsilbe Gespeichert: " + line_edit.text
		else:
			text_label.text = "Leer - Nicht Gespeichert!"
	else:
		text_label.text = "Bereits vorhanden - Nicht Gespeichert!"
	line_edit.text = ""


func _on_AddEndButton_button_down():
	if file_data.end.find(line_edit.text) == -1:
		if line_edit.text != "":
			file_data.end.append(line_edit.text)
			file_data.end.sort()
			FileManager.save_file(file_data)
			text_label.text = "Endsilbe Gespeichert: " + line_edit.text
		else:
			text_label.text = "Leer - Nicht Gespeichert!"
	else:
		text_label.text = "Bereits vorhanden - Nicht Gespeichert!"
	line_edit.text = ""


func sort_file_data():
	file_data.end.sort()
	file_data.mid.sort()
	file_data.start.sort()
	FileManager.save_file(file_data)

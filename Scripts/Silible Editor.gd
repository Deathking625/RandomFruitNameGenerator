extends Control

var file_data = FileManager.load_file()

onready var line_edit = $VBoxContainer/VBoxContainer/LineEdit
onready var text_label = $VBoxContainer/VBoxContainer/InfoText


func _on_BackButton_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/MainPage.tscn")


func print_text_label(position:int, returnvalue:int, name):
	var text:String
	var pos_name :String
	match position:
		0: pos_name = "Anfangssilbe"
		1: pos_name = "Mittelsilbe"
		2: pos_name = "Endsilbe"
	match returnvalue:
		0: text = name + " gespeichert als " + pos_name + "!"
		1: text = "Leerer Text! Silbe nicht gespeichert"
		2: text = "Position nicht gefunden. Silbe nicht gespeichert!"
		3: text = name + "schon vorhanden. Silbe nicht gespeichert!"
	text_label.text = text


func _on_AddStartButton_button_down():
	var _returnvalue:int = ProgrammManager.add_silible(0, line_edit.text)
	print_text_label(0, _returnvalue, line_edit.text)
	line_edit.text = ""


func _on_AddMidButton_button_down():
	var _returnvalue:int = ProgrammManager.add_silible(1, line_edit.text)
	print_text_label(1, _returnvalue, line_edit.text)
	line_edit.text = ""


func _on_AddEndButton_button_down():
	var _returnvalue:int = ProgrammManager.add_silible(2, line_edit.text)
	print_text_label(2, _returnvalue, line_edit.text)
	line_edit.text = ""


func sort_file_data():
	file_data.end.sort()
	file_data.mid.sort()
	file_data.start.sort()
	FileManager.save_file(file_data)

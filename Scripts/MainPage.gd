extends Control
signal refresh_list

var file_data = FileManager.load_file()
var name_list = ProgrammManager.get_name_list()
var current_name : String

onready var name_button = $VBoxContainer/NameButton
onready var title_text = $VBoxContainer/TitleText
onready var font_highlighted = preload("res://theme/casper_highlighted_dynamic_font.tres")

func _ready():
	pass


func sort_file_data():
	file_data.end.sort()
	file_data.mid.sort()
	file_data.start.sort()
	FileManager.save_file(file_data)


func get_title_text(return_value : int):
	var output:String
	match return_value:
		0: output = current_name + " gespeichert!"
		1: output = current_name + " existiert schon - nicht gespeichert!"
		2: output = "Kein Name - nicht gespeichert!"
		_: output = "Etwas Blödes ist passiert!"
	return output


func _on_NameButton_button_down():
	current_name = ProgrammManager.generate_name()
	name_button.text = current_name
	name_button.set("custom_fonts/font", font_highlighted)


func _on_SaveButton_button_down():
	ProgrammManager.name_list_pressed_name = current_name
	title_text.text = get_title_text(ProgrammManager.generate_plant(current_name))
	name_list = ProgrammManager.get_name_list()
	emit_signal("refresh_list")


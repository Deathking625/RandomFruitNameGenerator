extends Control

var file_data = FileManager.load_file()
var name_list = ProgrammManager.get_name_list()
var current_name : String

onready var name_button = $VBoxContainer/NameButton
onready var title_text = $VBoxContainer/TitleText
onready var rng = RandomNumberGenerator.new()


func generator():
	file_data = FileManager.load_file()
	rng.randomize()
	var length = rng.randi_range(1,4)
	rng.randomize()
	var text = file_data.start[rng.randi() % file_data.start.size()]
	rng.randomize()
	if length ==3:
		rng.randomize()
		text += file_data.mid[rng.randi() % file_data.mid.size()]
	if length ==4:
		rng.randomize()
		text += file_data.mid[rng.randi() % file_data.mid.size()]
	rng.randomize()
	text += file_data.end[rng.randi() % file_data.end.size()]
	return text


func sort_file_data():
	file_data.end.sort()
	file_data.mid.sort()
	file_data.start.sort()
	FileManager.save_file(file_data)


func _on_NameButton_button_down():
	current_name = generator()
	name_button.text = current_name


func _on_SaveButton_button_down():
	title_text.text = ProgrammManager.generate_plant(current_name)
	name_list = ProgrammManager.get_name_list()


func _on_SilibleEditorButton_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Silible Editor.tscn")


func _on_NameListButton_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/NameList.tscn")



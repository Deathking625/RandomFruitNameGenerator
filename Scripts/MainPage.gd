extends Control

var file_data = FileManager.load_file()
var name_list = FileManager.get_name_list()
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


#gehörtt geordnet!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
func _on_SaveButton_button_down():
	var is_in_saved = false
	for i in name_list.size():
		if name_list[i] == current_name:
			is_in_saved = true
			title_text.text = "NOT SAVED : name is in the list"
	if current_name == "":
		is_in_saved = true
		title_text.text = "NOT SAVED : name empty"
	if current_name == "TAB TO GENERATE NAME":
		is_in_saved = true
		title_text.text = "NOT SAVED : standart text"
	if !is_in_saved:
		rng.randomize()
		var poison_ran = rng.randf_range(0,1)
		var poisonous = false
		var type : int = 0
		if poison_ran <= .2:
			poisonous = true
		if current_name.ends_with("wurz") or current_name.ends_with("knolle"):
			type = 0
		elif current_name.ends_with("ling") or current_name.ends_with("pilz"):
			type = 1
		elif current_name.ends_with("kraut") or current_name.ends_with("blatt"):
			type = 2
		else:
			rng.randomize()
			type = rng.randi_range(0,5)
		FileManager.save_plant(current_name, type, poisonous)
		name_list = FileManager.get_name_list()
		title_text.text = "Name Saved"


func _on_SilibleEditorButton_button_down():
	get_tree().change_scene("res://Scenes/Silible Editor.tscn")


func _on_NameListButton_button_down():
	get_tree().change_scene("res://Scenes/NameList.tscn")



extends Node

var name_list_pressed_name : String

onready var rng = RandomNumberGenerator.new()


func generate_name():
	var file_data = FileManager.load_file()
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


func generate_plant(plant_name):
	var name_list = FileManager.get_name_list()
	for i in name_list.size():
		if name_list[i] == plant_name:
			return "NOT SAVED : name is in the list"
	if plant_name != "" and plant_name != "TAB TO GENERATE NAME":
		rng.randomize()
		var poison_ran = rng.randf_range(0,1)
		var poisonous = false
		var type : int = 0
		if poison_ran <= .2:
			poisonous = true
		if plant_name.ends_with("wurz") or plant_name.ends_with("knolle"):
			type = 0
		elif plant_name.ends_with("ling") or plant_name.ends_with("pilz"):
			type = 1
		elif plant_name.ends_with("kraut") or plant_name.ends_with("blatt"):
			type = 2
		else:
			rng.randomize()
			type = rng.randi_range(0,5)
		FileManager.save_plant(plant_name, type, poisonous)
		return "Name Saved"
	return "NOT SAVED : no name" 

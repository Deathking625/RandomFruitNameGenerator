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
	var name_list = ProgrammManager.get_name_list()
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


func get_plant_type_name(index):
	var plant_type
	match index:
		0:
			plant_type = "Roots"
		1:
			plant_type = "Mushroom"
		2:
			plant_type = "Herb"
		3:
			plant_type = "Crops"
		4:
			plant_type = "Shrup"
		4:
			plant_type = "Tree"
		_:
			plant_type = "Roots"
	return plant_type


func get_plant_type(resource, type_index):
	match type_index:
		0:
			resource.plant_type = resource.type.ROOTS
		1:
			resource.plant_type = resource.type.MUSHROOM
		2:
			resource.plant_type = resource.type.HERB
		3:
			resource.plant_type = resource.type.CROPS
		4:
			resource.plant_type = resource.type.SHRUP
		5:
			resource.plant_type = resource.type.TREE
		_:
			resource.plant_type = resource.type.ROOTS


func get_name_list():
	var plant_list = []
	var dir = Directory.new()
	if !dir.dir_exists("user://Plants/"):
		dir.open("user://")
		dir.make_dir("Plants")
	dir.open("user://Plants/")
	dir.list_dir_begin()
	
	var filename = dir.get_next()
	while(filename):
		if not dir.current_is_dir() and filename.ends_with(".tres"):
			var current_file = load("user://Plants/" + filename)
			if current_file.has_method("is_a_plant"):
				plant_list.append(current_file.plant_name)
		filename = dir.get_next()
	return plant_list









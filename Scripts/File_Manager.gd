extends Node
class_name File_Manager

func save_file(file_data):
	var file = File.new()
	file.open("res://Dictionary.json", File.WRITE)
	file.store_line(to_json(file_data))
	file.close()
	return file_data


func load_file():
	var file = File.new()
	if not file.file_exists("res://Dictionary.json"):
		print("404-File not found")
		return
	file.open("res://Dictionary.json", File.READ)
	var data = parse_json(file.get_as_text())
	file.close()
	return data


#func save_plants(saved_plants):
#	var file = File.new()
#	file.open("res://SavedPlants.json", File.WRITE)
#	file.store_line(to_json(saved_plants))
#	file.close()
#
#
#func load_plants():
#	var file = File.new()
#	if not file.file_exists("res://SavedPlants.json"):
#		print("SavedPlants not found")
#		return ["ERROR"]
#	file.open("res://SavedPlants.json", File.READ)
#	var data = parse_json(file.get_as_text())
#	file.close()
#	return data


func get_name_list():
	var plant_list : Array
	var dir = Directory.new()
	dir.open("res://Plants/")
	dir.list_dir_begin()
	
	var filename = dir.get_next()
	while(filename):
		if not dir.current_is_dir():
			plant_list.append(load("res://Plants/%s" %filename).plant_name)
		filename = dir.get_next()
	return plant_list


func save_plant(plant_name:String, plant_type:int, poisonous:bool):
	var resource = Resource.new()
	resource.set_script(load("res://Scripts/PlantResource.gd"))
	resource.plant_name = plant_name
	match plant_type:
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
	resource.poisonous = poisonous
	ResourceSaver.save("res://Plants/" + plant_name + ".tres" , resource)


func load_plant(plant_name):
	var resource = Resource.new()
	var file_exists = false
	var file_path = "res://Plants/" + plant_name + ".tres"
	







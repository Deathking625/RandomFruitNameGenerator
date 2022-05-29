extends Node
class_name File_Manager


func save_file(file_data):
	var file = File.new()
	file.open("res://Dictionary.json", File.WRITE)
	file.store_line(to_json(file_data))
	file.close()


func load_file():
	var file = File.new()
	if not file.file_exists("res://Dictionary.json"):
		print("404-File not found")
		return
	file.open("res://Dictionary.json", File.READ)
	var file_data = parse_json(file.get_as_text())
	file.close()
	return file_data


func save_plant(plant_name:String, plant_type:int, poisonous:bool):
	var resource = Resource.new()
	resource.set_script(load("res://Scripts/PlantResource.gd"))
	resource.plant_name = plant_name
	ProgrammManager.get_plant_type(resource, plant_type)
	resource.poisonous = poisonous
# warning-ignore:return_value_discarded
	ResourceSaver.save("user://Plants/" + plant_name + ".tres" , resource)
	print(plant_name, plant_type, poisonous)


func load_plant(plant_name):
	var file_path = "user://Plants/" + plant_name + ".tres"
	var plant = []
	var plant_type : String
	var file2kek = File.new()
	if !file2kek.file_exists(file_path):
		return 0
	var resource = ResourceLoader.load(file_path)
	if !resource.has_method("is_a_plant"):
		print("ERROR: wrong resource")
		return 1
	plant_type = ProgrammManager.get_plant_type_name(resource.plant_type)
	plant.append(resource.plant_name)
	plant.append(plant_type)
	plant.append(resource.poisonous)
	return plant










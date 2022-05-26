extends Control

var plant_name = ProgrammManager.name_list_pressed_name
var type = 0
var poisonous = false

var saved_plants = FileManager.load_plants()

onready var label = $VBoxContainer/Label
onready var rng = RandomNumberGenerator.new()

func _ready():
	label.text = plant_name
	var plant_path = "res://Plants/" + plant_name + "tres"
	var file = File.new()
	file.open(plant_path)
	


func display_plant():
	pass


func get_type(f_type):
	match f_type:
		0:
			type = "Roots"
		1:
			type = "Mushroom"
		2:
			type = "Herp"
		3:
			type = "Crops"
		4:
			type = "Shrup"
		5:
			type = "Tree"


func _on_BackButton_button_down():
	get_tree().change_scene("res://Scenes/NameList.tscn")


extends Control

var plant_name = ProgrammManager.name_list_pressed_name
var type:int
var edible:int

onready var label = $VBoxContainer/Label
onready var rng = RandomNumberGenerator.new()

func draw_plant(_plant_name, _type, edibility):
	label.text = (_plant_name + "\n" + 
	ProgrammManager.get_plant_type_name(_type) + "\n")
	

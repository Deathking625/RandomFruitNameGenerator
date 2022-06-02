extends Control

var plant_name = ProgrammManager.name_list_pressed_name
var type = 0
var poisonous = false

onready var label = $VBoxContainer/Label
onready var rng = RandomNumberGenerator.new()

func _ready():
	label.text = plant_name

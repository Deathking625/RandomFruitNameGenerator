extends Control

var group = preload("res://NameListButtonGroup.tres")
var name_list = ProgrammManager.get_name_list()

onready var scroll_container = $VBoxContainer/ScrollContainer/VBoxContainer

func _ready():
	for i in range(0,scroll_container.get_child_count()):
		scroll_container.get_child(i).queue_free()
	for i in range(0, name_list.size()):
		generate_button(name_list[i])


func generate_button(text:String):
	var button = Button.new()
	button.text = text
	button.name = text
	button.rect_min_size.y = 30
	button.rect_min_size.x = 400
	button.group = load("res://NameListButtonGroup.tres")
	scroll_container.add_child(button)
	button.connect("button_down", self, "_on_button_down")


func _on_button_down():
	ProgrammManager.name_list_pressed_name = group.get_pressed_button().name
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/PlantViewer.tscn")


func _on_BackButton_button_down():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/MainPage.tscn")















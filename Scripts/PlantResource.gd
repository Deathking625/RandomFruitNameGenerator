extends Resource
class_name Plant

export var plant_name : String
enum type{ROOTS, MUSHROOM, HERB, CROPS, TREE, CACTUS}
export (type) var plant_type
enum habitat{}
export var edibility : int


func is_a_plant():
	#this method is just to check, if the right resource is loaded
	pass

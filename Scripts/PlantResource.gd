extends Resource
class_name Plant

export var plant_name : String
enum type{ROOTS, MUSHROOM, HERB, CROPS, SHRUP, TREE}
export (type) var plant_type
export var poisonous : bool

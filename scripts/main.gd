# main.gd
extends Node2D
# export_vars
@export var cell_scene : PackedScene # drag and drop our cell scene
# var cell_scene = load("res://scenes/cell.tscn") # potential alternative

# @{onready_vars}
# vars
var row_count : int = 45
var column_count : int = 80
var cell_width: int = 15
var cell_matrix: Array = []

# @{consts}
# builtins
# ready
func _ready():
	# set up the random number generator
	var rng = RandomNumberGenerator.new()

	for column in range(column_count):
		cell_matrix.push_back([]) # create an empty array to hold the cells for this column
		for row in range(row_count):
			# instantiate the cell
			var cell = cell_scene.instantiate()
			
			# add it to our scene
			self.add_child(cell)
			
			# set its position based on what column and row it is
			cell.position = Vector2(column * cell_width, row * cell_width)
			if(rng.randi_range(0,1)): # randomly generate 0s or 1s (these will be interpretted as true and false)
				cell.visible = false # make some invisible
			cell_matrix[column].push_back(cell) # add this cell to the appropriate column array


# @{customs}


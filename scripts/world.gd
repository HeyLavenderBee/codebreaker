extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_game():
	var code: Array = []
	for i in range(4):
		code.append(randi_range(1,6)) #gets a random number in range and adds to array
	print(code)


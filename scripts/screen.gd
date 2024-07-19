extends CanvasLayer

@onready var numbers = $numbers
var code: Array = []
var input: Array = []
var right_place: int = 0
var wrong_place: int = 0

func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_game():
	$right_place.hide()
	$wrong_place.hide()
	for i in range(4):
		code.append(randi_range(1,6)) #gets a random number in range and adds to array
	print(code)

func _on_send_numbers_pressed():
	check_numbers()

func check_numbers():
	$right_place.show()
	$wrong_place.show()
	input = [int($numbers/number1.text),int($numbers/number2.text),int($numbers/number3.text),int($numbers/number4.text)]
	print(input)
	for u in range(0,4):
		if code[u] == input[u]:
			print("matching index: ", u) 
			right_place += 1
		if code[u] != input[u]:
			for b in range(0,4):
				if code[u] == input[b]:
					wrong_place += 1
					print("wrong place: ", b)
	show_input()
	check_win()
	clear_input()

func show_input():
	$right_place.text = "Right place: %.f" %right_place
	$wrong_place.text = "Wrong place: %.f" %wrong_place
	$inputs/input1.text = str(input)

func clear_input():
	$numbers/number1.text = ""
	$numbers/number2.text = ""
	$numbers/number3.text = ""
	$numbers/number4.text = ""

func check_win():
	if code == input:
		print("You won!")

func _on_settings_button_pressed():
	$settings.show()

func _on_back_button_pressed():
	$settings.hide()

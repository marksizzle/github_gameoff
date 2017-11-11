extends LineEdit

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var beerList = {["beer1"] : "correct!"} 

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	grab_focus()
	pass

# If there is any user input perform this function
func _input(event):
	# If the enter key is pressed check for the typed word in the dictionary
	if Input.is_key_pressed(KEY_RETURN) == true:
		# Grab the users text and convert it to lower case for comparison
		var inputText = get_text()
		inputText = inputText.to_lower()
		
		# Look for a response in the keys  of the dictionary
		for key in beerList.keys():
			if inputText in key:
				get_node("../Label").set_text(beerList[key])
				return
		get_node("../Label").set_text("incorrect!")


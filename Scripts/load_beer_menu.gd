extends Node2D

var activeWord = "XXXXXXXXXXXX"     #Display XXX's until a word is chosen

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#get the words from the file and put them in a list
	var word_list = loadWords()     #load the words into an array
	
	# Randomize seed
	randomize()
	
	var winners = [] #indexes of beers that have already been modified
	
	#pick some winners
	var i=0
	while (i < 2):
		var potentialWinner = randi() % get_children().size()
		if winners.has(potentialWinner): continue #already selected, bail
		winners.append(potentialWinner)
		print("winners:", winners)
		i=i+1
	
	#do special things to the winners
	for winner in winners:
		#SET GREEN HERE
		get_children()[winner].active=true
		print(get_children()[winner])
		#get_children()[winner].add_color_override("font_color", Color(250,0,0,1))
		
	
	# For each child rich text box, assign a random word from the array
	for beer in get_children():
		activeWord = word_list[randi() % word_list.size()]
		# Remove the chosen (random) word from the array so that it doesn't get selected again
		word_list.erase(activeWord)
		# Take the (random) word and assign it to a rich text box
		beer.set_text(activeWord)
	pass
	
	


func loadWords():
	var lines = []                              #set an empty array
	var file = File.new();                      #create an instance
	file.open("res://TextFiles/beer_list.txt", File.READ); #open the file into instance
	while not file.eof_reached():               #while we're not at end of file
	    lines.append(file.get_line())           #append each line to the array
	return lines                                #send the array back
	

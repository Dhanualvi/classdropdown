extends OptionButton

var file = FileAccess.open("res://resource/class.csv",FileAccess.READ)

func _ready():
	var jobname_data = import_job_name()
	populate_dropdown(jobname_data)

func populate_dropdown(data):
	for i in range(data.size()):
		add_item(data[i],i)

func import_job_name():
	var job_names = []
	
	while !file.eof_reached(): 
		var data_set = file.get_csv_line()
		#print("Data set:", data_set)  # Debug print to check data read from CSV
		var job_name = data_set[1].strip_edges()  # Assuming job name is in the second column
		job_names.append(job_name)
	
	file.close()
	print("Job names:", job_names) 
	return job_names
	
func _on_item_selected(text):
	print("Selected item:", text)
	# Do whatever you need with the selected item

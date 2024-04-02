extends Control

@onready var skills = $Control/BoxContainer/Skill
@onready var job_name_label = $JobName
@onready var job_desc_label = $JobDescription
@onready var job_skill_label = $Control/BoxContainer/Skill

var chosen_job_name := 0

var file = FileAccess.open("res://resource/class.csv",FileAccess.READ)

func _ready():
	pass
func import_resource_data():
	var job_dict = {}
	file.seek(0)
	while !file.eof_reached():
		var data_set = file.get_csv_line()
		var job_name = int(data_set[0].strip_edges()) # Assuming job ID is in the first column
		job_dict[job_name] = data_set

	#print(job_dict)
	return job_dict
	
func print_job_data(job_data, job_name):
	if job_name in job_data:
		var data_set = job_data[job_name]
		print("Job ID:", data_set[0]) 
		print("Job Name:", data_set[1])  
		print("Description:", data_set[2])  
		print("Skills:", data_set[3])  
		job_name_label.text = data_set[1]
		job_desc_label.text = data_set[2]
		job_skill_label.text = data_set[3]
	else:
		print("Job ID not found:", job_name)


func _on_job_dropdown_list_item_selected(index):
	var job_data = import_resource_data()
	chosen_job_name = index
	print_job_data(job_data, chosen_job_name)

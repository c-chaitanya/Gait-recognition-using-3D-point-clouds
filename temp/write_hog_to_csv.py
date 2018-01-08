import os
FOLDER = 'csv_dataset'
file_name = "down0" +'.csv'
newfile =open(file_name ,'a')
for x in range(1,91):
	current_file = ('{}'.format(x))
	current_file += '.csv'
	name = os.path.join(os.getcwd(),FOLDER,current_file)
	csvfile = open(name,'r')
	data = csvfile.read()
	newfile.write(data)
	csvfile.close()
newfile.close()

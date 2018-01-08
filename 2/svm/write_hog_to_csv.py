import os
FOLDER = 'ESF'
for i in range(1,11):
	file_name = "ESF" + str(i) +'.csv'
	newfile =open(file_name ,'a')
	for x in range(i,501,10):
		current_file = ('{}'.format(x))
		current_file += '.csv'
		name = os.path.join(os.getcwd(),FOLDER,current_file)
		csvfile = open(name,'r')
		data = csvfile.read()
		newfile.write(data)
		csvfile.close()
newfile.close()

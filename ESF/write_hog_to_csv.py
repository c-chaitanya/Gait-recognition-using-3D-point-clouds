import os
FOLDER = 'pca-csv'
for i in range(1,7):
	file_name = "o" + str(i) +'.csv'
	newfile =open(file_name ,'a')
	for x in range(i,91,6):
		current_file = ('o{}'.format(x))
		current_file += '.txt'
		name = os.path.join(os.getcwd(),current_file)
		csvfile = open(name,'r')
		data = csvfile.read()
		newfile.write(data)
		csvfile.close()
newfile.close()

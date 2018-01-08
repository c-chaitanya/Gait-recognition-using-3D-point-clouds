import csv
import sys
txt_file = sys.argv[1]
csv_file = sys.argv[2]
in_txt = csv.reader(open(txt_file, "rb"), delimiter = ',')
out_csv = csv.writer(open(csv_file, 'wb'))

out_csv.writerows(in_txt)
print 'done! go check your NewProcessedDoc.csv file'

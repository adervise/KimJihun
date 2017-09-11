#!/usr/bin/python
 
import subprocess
import sys
import datetime
from datetime import date, timedelta
 
def get_date():
    if sys.argv[1] == 'yday':
        dateSelect = date.today() - timedelta(1)
        return dateSelect.strftime('%Y/%m/%d'), dateSelect.strftime('%Y-%m-%d'), dateSelect.strftime('%Y%m%d')
    else:
        try:
            input = sys.argv[1]
            reg_date = datetime.datetime.strptime(input, '%Y%m%d').date()
            return reg_date.strftime('%Y/%m/%d'), reg_date.strftime('%Y-%m-%d'), reg_date.strftime('%Y%m%d')
        except ValueError:
            subprocess.call(['echo', 'signal=end'])
            sys.exit()

if __name__ == "__main__":
    ymd1, ymd2, ymd3 = get_date()
    capture_output1 = 'date1=' + ymd1
    capture_output2 = 'date2=' + ymd2
    capture_output3 = 'date3=' + ymd3
    subprocess.call(['echo', capture_output1])
    subprocess.call(['echo', capture_output2])
    subprocess.call(['echo', capture_output3])
    subprocess.call(['echo', 'signal=next'])
    

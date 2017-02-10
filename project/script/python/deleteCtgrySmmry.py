#!/usr/bin/python

import sys
import subprocess

date_param = sys.argv[1]
date = date_param.replace('-', '')
query = 'delete from TC_BD_CTGRY_SM where COLCT_DT=' + '"' + date + '";' + ' commit;'
subprocess.call(['mysql', '-u******', '-******', '-e', query, '******'])

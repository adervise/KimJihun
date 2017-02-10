#!/usr/bin/python

import subprocess
import ConfigParser
import sys
from common import execute_sqoop, make_log

configFilePath = '/root/onnara/bizlog/conf/bizlog.conf'

if __name__ == "__main__":
#    ymd = sys.argv[1]
    config = ConfigParser.ConfigParser()
    config.read(configFilePath)
    driver = config.get('IMPORT', 'driver')
    connect = config.get('IMPORT', 'connect')
    username = config.get('IMPORT', 'username')
    password = config.get('IMPORT', 'password')
    query = config.get('IMPORT', 'query')
    targetDir = config.get('IMPORT', 'targetDir')
    delimiter = config.get('IMPORT', 'delimiter')
    logFilePath = config.get('IMPORT', 'logFilePath')
    cmd = '/engn001/sbp/bigpack/sqoop/bin/sqoop import --driver ' + driver + ' --connect ' + connect + ' --username ' + username + ' --password ' + password + ' --query "' + query + ' --target-dir ' + targetDir + ' --fields-terminated-by ' + delimiter +  ' -m 1'
    print cmd
#    std_out, std_err = execute_sqoop(cmd)
#    make_log(std_err, logFilePath)

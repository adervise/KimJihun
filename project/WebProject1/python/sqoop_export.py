#!/usr/bin/python

import subprocess
import ConfigParser
from common import execute_sqoop, make_log

configFilePath = '/root/bizlog/conf/bizlog.conf'

if __name__ == "__main__":
    config = ConfigParser.ConfigParser()
    config.read(configFilePath)
    connect = config.get('EXPORT', 'connect')
    username = config.get('EXPORT', 'username')
    password = config.get('EXPORT', 'password')
    table = config.get('EXPORT', 'table')
    exportDir = config.get('EXPORT', 'exportDir')
    delimiter = config.get('EXPORT', 'delimiter')
    columns = config.get('EXPORT', 'columns')
    logFilePath = config.get('EXPORT', 'logFilePath')
    cmd = 'sqoop export' + ' --connect ' + connect + ' --username ' + username + ' --password ' + password + ' --table ' + table + ' --export-dir ' + exportDir + ' --input-fields-terminated-by ' + delimiter + ' --columns ' + columns
    std_out, std_err = execute_sqoop(cmd)
    make_log(std_err, logFilePath)

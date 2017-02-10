#!/usr/bin/python
 
import subprocess

def execute_sqoop(cmd) :
    fd = subprocess.Popen(cmd, shell=True,
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE)
    return fd.stdout, fd.stderr

def make_log(std_err, logFilePath):
    with open(logFilePath, 'a') as logFile:
        for line in std_err.readlines():
            logFile.write(line)

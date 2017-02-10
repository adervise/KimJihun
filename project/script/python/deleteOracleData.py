#!/usr/bin/python

import sys
import ConfigParser
import cx_Oracle

configFilePath = '/root/onnara/bizlog/conf/bizlog.conf'
stdDate = sys.argv[1]
config = ConfigParser.ConfigParser()
config.read(configFilePath)
user = config.get('ORACLE_INFO', 'user')
password = config.get('ORACLE_INFO', 'password')
tns = config.get('ORACLE_INFO', 'tns')


def countData():
    try:
        con = cx_Oracle.connect(user, password, tns)
        cursor = con.cursor()
        cursor.execute("""
        select count(*) from TS_LHONR_STATS_LOG where STDR_YMD = :arg_1 """, arg_1=stdDate)
        count  = cursor.fetchone()[0]
        con.close()
    except:
        con.close()
    return count

def deleteDate(cnt):
    try:
        con = cx_Oracle.connect(user, password, tns)
        cursor = con.cursor()
        if cnt != 0:
            cursor.execute("""
            delete from TS_LHONR_STATS_LOG where STDR_YMD = :arg_2 """, arg_2=stdDate)
            cursor.execute("""
            commit""")
            print 'delete'
        else:
            print 'pass'
        con.close()
    except:
        con.close()

if __name__ == "__main__":
    cnt = countData()
    deleteDate(cnt)

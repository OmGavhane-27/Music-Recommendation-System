#!C:\Users\Megha Home\AppData\Local\Programs\Python\Python310\python
import mysql.connector as mycon

def connect() : 
    con=mycon.connect(host='bp1yuikal3saku6sax0p-mysql.services.clever-cloud.com',user='umjdnc7qzcgmcewa',password='7ELOL60Snc27GDiaStK1',database='bp1yuikal3saku6sax0p')
    return con
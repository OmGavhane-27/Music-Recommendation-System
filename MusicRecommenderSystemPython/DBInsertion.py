from DBConnect import *

def insertEmotions(userid1="NA",emotion="NA") : 
    conn = connect()    
    cursor = conn.cursor()
    
    args = [userid1,emotion]
    args1=cursor.callproc('insertEmotions', args)
    print("Return value:", args1)
    #for result in cursor.stored_results():
     #       print(result.fetchall())
    #cnt=cursor.rowcount 
    conn.commit()
    conn.close()
def getDictionary() :  
    conn = connect()    
    cursor = conn.cursor() 
    cursor.execute("select srNo as key1,title as val from labels")
    out = cursor.fetchall()
    variable = {key:val for key,val in out}
    print(variable)
    conn.commit()
    return variable 
def getLabelCount() :  
    conn = connect()    
    cursor = conn.cursor() 
    cursor.execute("select count(*) as cnt from labels")
    out = cursor.fetchall() 
    print(out[0][0])
    conn.commit()
    return int(str(out[0][0]).strip())
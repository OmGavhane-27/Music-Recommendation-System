package beans;

import java.sql.*;

public class GetConnection {

	private Connection dbconnection;
    public GetConnection()
    {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
          //  dbconnection=DriverManager.getConnection("jdbc:mysql://localhost:3306/dataIntegrityDB?user=root&password=crosspolo&useSSL=false&allowPublicKeyRetrieval=true");
              dbconnection=DriverManager.getConnection("jdbc:mysql://umjdnc7qzcgmcewa:7ELOL60Snc27GDiaStK1@bp1yuikal3saku6sax0p-mysql.services.clever-cloud.com:3306/bp1yuikal3saku6sax0p");
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
    }
    
    public Connection getConnection()
    {
        return(dbconnection);
    }
	
}

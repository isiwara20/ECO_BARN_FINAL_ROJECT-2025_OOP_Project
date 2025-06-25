package com.ecobarn.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	private static String url = "jdbc:mysql://127.0.0.1:3306/ecobarn";
	private static String user = "root";
	private static String pass = "oslocc123";
	private static Connection con;
	
	
    public static Connection getConnection() throws Exception {
        
    	try {
    		//Class.forName("com.mysql.jdbc.Driver");
    		Class.forName("com.mysql.cj.jdbc.Driver"); 

    		{
    			con = DriverManager.getConnection(url,user,pass);
    		}
    		
    	}catch(Exception e)
    	{
    		System.out.println("Database Not Connected : " + e);
    	}
    	return con;
    	
    }
}

package com.GymApplication.connections;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnections {
	public static Connection getConnection() throws Exception
	{
		
		
		Connection conObj = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conObj = DriverManager.getConnection("jdbc:mysql://localhost:3306/gymProject","root", "Nithin@2001");
						
		} catch (Exception e) {
			conObj = null;
			System.out.println(e);
		}

		return conObj;
	}

}

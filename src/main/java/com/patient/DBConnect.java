package com.patient;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static String url = "jdbc:mysql://localhost:3306/hospital";
	private static String username = "root";
	private static String password = "12345678";
	private static Connection con;
	
	public static Connection getConnection() {
			
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection(url, username, password);
				System.out.println("Database Connection is  success!!!");
				
			} catch (Exception e) {
				System.out.println("Database Connection is not success!!!");
			}
			return con;
		}
}

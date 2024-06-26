package com.patient;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
//import java.util.List;


public class PatientDBUtil {
	
	//add data to test result

	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet result = null;
	
	public static boolean addTestResult(String nic,String reportType, String testResult, String comments) {
		boolean isSuccess = false;
		
		//DB connection
		String url = "jdbc:mysql://localhost:3306/hospital";
		String user = "root";
		String pass = "12345678";
		
		try {
			
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();
			
			String sql = "insert into patient_test_result values(0,'"+nic+"','"+reportType+"','"+testResult+"','"+comments+"')";
			int result = stmt.executeUpdate(sql);
			
			
			
//			
			
//			  String sql = "INSERT INTO patient_test_result (nic, reportType, testResult, comments) VALUES (?, ?, ?, ?)";
//		        PreparedStatement pstmt = con.prepareStatement(sql);
//		        pstmt.setString(1, nic);
//		        pstmt.setString(2, reportType);
//		        pstmt.setString(3, testResult);
//		        pstmt.setString(4, comments);
////		        pstmt.setBinaryStream(5, fileStream);
//
//		        int result = pstmt.executeUpdate();
		        
			if(result > 0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return isSuccess;
	}
	
	public static List<PatientData> getPatientData(String nic){
		
		ArrayList<PatientData> pData = new ArrayList<PatientData>();
		
		//DB connection
//				String url = "jdbc:mysql://localhost:3306/hospital";
//				String user = "root";
//				String pass = "12345678";
		
		try {
			
//			Class.forName("com.mysql.jdbc.Driver");
//			
//			Connection con = DriverManager.getConnection(url, user, pass);
//			Statement stmt = con.createStatement();
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from patient_test_result where nic='"+nic+"'";
			result = stmt.executeQuery(sql);
			
			while(result.next()) {
				int id = result.getInt(1);
				String nIdNumber = result.getString(2);
				String reportType = result.getString(3);
				String testResult = result.getString(4);
				String comments = result.getString(5);
				
				PatientData pd = new PatientData(id, nIdNumber, reportType, testResult, comments);
				pData.add(pd);
			}
//			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return pData;
		
	}
	
	public static boolean updatePatientTestResult(String pid, String nic, String reportType ,String testResult ,String comments) {
		boolean isSuccess = false;
		

		//db connection
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "update patient_test_result set reporttype = '"+reportType+"' , testresult = '"+testResult+"',comments = '"+comments+"'" + "where id='"+pid+"'";
			int result = stmt.executeUpdate(sql);
			
			if(result > 0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
	}
	
	public static boolean deletePatientTestResult(String id) {
		boolean isSuccess = false;
		int convertId = Integer.parseInt(id);
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "delete from patient_test_result where id = '"+convertId+"' ";
			int result = stmt.executeUpdate(sql);
			
			if (result > 0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}

}

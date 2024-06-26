package com.patient;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class PatientTestResultInsert
 */
@WebServlet("/PatientTestResultInsert")
public class PatientTestResultInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String nic = request.getParameter("nic");
		String reportType = request.getParameter("reportType");
		String testResult = request.getParameter("testResult");
		String comments = request.getParameter("comments");
		
		//upload file
		 
//		Part filePart = request.getPart("fileUpload");
//// Ensure you have an input element with name="file" in your form
//		if (filePart != null) {
//		InputStream fileInputStream = filePart.getInputStream();
//		      
//		}    
		
		
	
		 boolean isTrue = PatientDBUtil.addTestResult(nic, reportType, testResult, comments );
		
		if (isTrue == true) {
			RequestDispatcher dis2 = request.getRequestDispatcher("success.jsp");
			dis2.forward(request, response);

		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		
		}
		
	

	}

}

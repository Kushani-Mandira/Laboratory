package com.patient;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class patientTestResultDeleteServelet
 */
@WebServlet("/patientTestResultDeleteServelet")
public class patientTestResultDeleteServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String pid = request.getParameter("pid");
	        
	        // Perform the deletion operation using the 'pid' value
		 boolean isDeleted;
		 isDeleted = PatientDBUtil.deletePatientTestResult(pid);
		 
		 if(isDeleted == true) {
			 response.getWriter().write("Record deleted successfully");
		 }else {
			 response.getWriter().write("Record not deleted..Try again later");
		 }
	        
	        // Optionally, you can send a response back to the client (JavaScript) indicating the status of the deletion.
	    
	}

}

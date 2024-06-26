package com.patient;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class patientTestResultUpdateServelet
 */
@WebServlet("/patientTestResultUpdateServelet")
public class patientTestResultUpdateServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pid = request.getParameter("editPID");
		String nic = request.getParameter("editNIC");
		String reportType = request.getParameter("editReportType");
		String testResult = request.getParameter("editTestResult");
		String comments = request.getParameter("editComments");
		
		boolean isUpdated = PatientDBUtil.updatePatientTestResult(pid, nic, reportType, testResult, comments);
		
		if(isUpdated == true) {
			
			List<PatientData> patientData = PatientDBUtil.getPatientData(nic);
			request.setAttribute("pData", patientData); //set values
			
			RequestDispatcher dis = request.getRequestDispatcher("viewPatientTestResult.jsp");
			dis.forward(request, response);
			
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
				
		
	}

}

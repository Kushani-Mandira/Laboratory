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
 * Servlet implementation class patientTestResultViewServelet
 */
@WebServlet("/patientTestResultViewServelet")
public class patientTestResultViewServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nic = request.getParameter("nic");
		
//		try {
//			List<PatientData> patientData = PatientDBUtil.getPatientData(nic);
//			request.setAttribute("pData", patientData); //set values
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		
		try {
		    List<PatientData> patientData = PatientDBUtil.getPatientData(nic);
		    if (patientData.isEmpty()) {
		        request.setAttribute("noResult", true);
		    } else {
		        request.setAttribute("pData", patientData); // set values
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("viewPatientTestResult.jsp");
		dis.forward(request, response);
	}

}

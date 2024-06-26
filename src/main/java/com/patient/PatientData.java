package com.patient;

public class PatientData {
	
	private int id;
	private String nIdNumber;
	private String reportType;
	private String testResult;
	private String comments;
	
	
	public PatientData(int id, String nIdNumber, String reportType, String testResult, String comments) {
		this.id = id;
		this.nIdNumber = nIdNumber;
		this.reportType = reportType;
		this.testResult = testResult;
		this.comments = comments;
	}


	public int getId() {
		return id;
	}

	public String getnIdNumber() {
		return nIdNumber;
	}

	public String getReportType() {
		return reportType;
	}

	public String getTestResult() {
		return testResult;
	}

	public String getComments() {
		return comments;
	}


	
	
	
	
	
	
	

}

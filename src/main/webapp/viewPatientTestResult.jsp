<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View test result</title>

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
	crossorigin="anonymous">	
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 	<link rel="stylesheet" type="text/css" href="./css/viewPatientTestResult.css">
 	
</head>
<body>
<div class="container mt-5">
<div class = "header-container">
	<h2 >View patient test result</h2>
</div>
<div class="form-around-container">
<form action="viewpatientdatabynic" method="post">
		<label class="input-filed-name">Add patient NIC</label>
		<input type = "text" placeholder="Enter NIC" name="nic" class="input-nic">    
		<button type="submit" class="seacrh-button">search patient</button> 
    <!--  <input type = "submit" value = "search patient"> -->    
    </form>
 </div>  
    <a href="landingPage.jsp" ><button class="mt-3 back-to-home-button">Back to home</button></a>
</div>    
    

    
	<div class = "container  mt-5">
   		<table class="table table-dark">
		  <thead>
		    <tr class="table-dark">
		    <th>pid	</th>
		      <th scope="col">NIC</th>
		      <th scope="col">Report type</th>
		      <th scope="col">Test Result</th>
		      <th scope="col">Comments</th>
		      <th scope="col"> Action </th>
		    </tr>
		  </thead>
		  <tbody id="patientDataBody">
		 
		     <c:forEach var="pd" items="${pData}">
		      <tr class="table-dark">
		     
		<!--  		<c:set var="nic" value="${cus.nIdNumber}"/>
				<c:set var="reportType" value="${cus.reportType}"/>
				<c:set var="testResult" value="${cus.testResult}"/>
				<c:set var="comments" value="${cus.comments}"/> -->
				
					<td  class="table-dark">${pd.id} </td>
					<td  class="table-dark">${pd.nIdNumber}</td>
					<td  class="table-dark">${pd.reportType}</td>
			<!--		<td  class="table-dark">${pd.testResult}</td>
					<td  class="table-dark">${pd.comments}</td>  -->
					<td class="table-dark">
			            <c:choose>
			                <c:when test="${fn:length(pd.testResult) > 10}">
			                    <c:out value="${fn:substring(pd.testResult, 0, 10)}..." />
			                </c:when>
			                <c:otherwise>
			                    <c:out value="${pd.testResult}" />
			                </c:otherwise>
			            </c:choose>
			        </td>
					 <td class="table-dark">
			            <c:choose>
			                <c:when test="${fn:length(pd.comments) > 10}">
			                    <c:out value="${fn:substring(pd.comments, 0, 10)}..." />
			                </c:when>
			                <c:otherwise>
			                    <c:out value="${pd.comments}" />
			                </c:otherwise>
			            </c:choose>
			        </td>
					
					<td>
					<button type="button" class="btn btn-secondary edit-button"
					    data-bs-toggle="modal" data-bs-target="#exampleModal"
					    data-pid = "${pd.id}"
					    data-nic="${pd.nIdNumber}"
					    data-report-type="${pd.reportType}"
					    data-test-result="${pd.testResult}"
					    data-comments="${pd.comments}">
					    View more & edit
					</button>
					<button type="button" class="btn btn-danger ms-1 delete-button" data-pid="${pd.id}">Delete</button>
					
					</td>
			   </tr>
				
		     </c:forEach>
		 
		  </tbody>
		</table>
		<%-- Check if the "noResult" attribute is set --%>
		<c:if test="${not empty noResult}">
		    <div class="alert alert-warning" role="alert">
		       No results to show! Check the NIC number.
		    </div>
		</c:if>
		</div>
		
		
		
		
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Test Result</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       		 <!-- Form to edit patient data -->
			        <form id="editForm" action="updatepatienttestdata"  method="post">
			          <!-- Input fields for editing patient data -->
			          <div class="form-group">
			            <label for="editNIC">PID</label>
			            <input type="text" class="form-control" id="editPID" name="editPID" readonly>
			             <div id="enterResultHelp" class="form-text" style="color:red">Not editable</div>
			          </div>
			          <div class="form-group">
			            <label for="editNIC">NIC</label>
			            <input type="text" class="form-control" id="editNIC" name="editNIC" readonly>
			            <div id="enterResultHelp" class="form-text" style="color:red">Not editable</div>
			          </div>
			          <div class="form-group">
			            <label for="slectReportType" class="form-label">Select report type</label>
				    <select class="form-select" name="reportType" id="selectReportType">
				        <option>Open this select type</option>
				        <option>Blood Test Report</option>
				        <option>X-ray Report</option>
				        <option>CT Scan Report</option>
				    </select>
				    <div id="reportTypeError" class="text-danger"></div>
			          </div>
			          <div class="form-group">
			            <label for="editTestResult">Test Result</label>
			            <input type="text" class="form-control" id="editTestResult" name="editTestResult">
			          </div>
			          <div class="form-group">
			            <label for="editComments">Comments</label>
			            <textarea class="form-control" id="editComments" rows="3"  name="editComments"></textarea>
			          </div>
			           <div class="modal-footer mt-5">
			           <button type="submit" class="btn btn-primary">Save changes</button>
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>     
				      </div>
			           
			        </form>
		      </div>
		     
		    </div>
		  </div>
		</div>
					
		
		
		
		
	<script>
	    $(document).ready(function () {
	        // When the "Edit" button is clicked, extract the data attributes and populate the modal fields
	        $(".edit-button").click(function () {
	            var modal = $("#exampleModal");
	            var id = $(this).data("pid");
	            var nic = $(this).data("nic");
	            var reportType = $(this).data("report-type");
	            var testResult = $(this).data("test-result");
	            var comments = $(this).data("comments");
		
	            modal.find("#editPID").val(id);
	            modal.find("#editNIC").val(nic);
	            modal.find("#editReportType").val(reportType);
	            modal.find("#editTestResult").val(testResult);
	            modal.find("#editComments").val(comments);
	        });
	    });
	</script>
	
	
	<!-- to delete the data -->
	<script>
    $(document).ready(function () {
        $(".delete-button").click(function () {
            var pid = $(this).data("pid");
            var confirmation = confirm("Are you sure you want to delete this record?");

            if (confirmation) {
                $.ajax({
                    url: "patientTestResultDeleteServelet",
                    type: "POST",
                    data: { pid: pid },
                    success: function(response) {
                        // Handle the response from the servlet, e.g., show a success message
                        alert("Record deleted successfully");
                        setTimeout(function() {
                            location.reload();
                        }, 1000); // 1000 milliseconds (1 second)
                        // Remove the deleted row from the table
                        var rowToRemove = $("#patientDataBody tr[data-pid='" + pid + "']");
                        rowToRemove.remove();
                        
                       
                    },
                    error: function() {
                        // Handle any errors
                        alert("Error deleting record");
                    }
                });
            }
        });
    });
</script>

		
					
		
		
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>  

</body>

		
</html>





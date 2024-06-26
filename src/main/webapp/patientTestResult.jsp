<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add test result</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
	crossorigin="anonymous">
	
	 <link rel="stylesheet" type="text/css" href="./css/patientTestResult.css">
</head>
<body>
	<div class="header-container">	
		<h2>Add Patient Test Result</h2>
	</div>	

    <div class="form-around-conatiner" >
    <form action="inserttestresult" method="post" id="testResultForm"   onsubmit="clearForm();" >
	 <div class="mb-3">
	    <label for="patientNIC" class="form-label">Enter patient id</label>
	    <input type="text" class="form-control" id="textNIC" name="nic" placeholder="Enter patient NIC">
	    <div id="nicError" class="text-danger"></div>
	</div>

	  <div class="mb-3">
	    <label for="slectReportType" class="form-label">Select report type</label>
	    <select class="form-select" name="reportType" id="selectReportType">
	        <option>Open this select type</option>
	        <option>Blood Test Report</option>
	        <option>X-ray Report</option>
	        <option>CT Scan Report</option>
	    </select>
	    <div id="reportTypeError" class="text-danger"></div>
	</div>

	 
	   <div class="mb-3">
	    <label for="addTestResult" class="form-label">Add test result</label>
	    <input type="text" class="form-control"  placeholder="Add test result" name = "testResult">
	    <div id="enterResultHelp" class="form-text">Positive/Negative or any value</div>
	  </div>
	   <div class="mb-3">
	    <label for="commnets" class="form-label">Any comments</label>
	    <textarea class="form-control" id="exampleFormControlTextarea1" rows="4"  name="comments"></textarea>
	  </div>
	  
<!--  	  <div class="mb-3">
		  <label for="formFile" class="form-label">Default file input example</label>
		  <input class="form-control" type="file"  name="fileUpload" accept=".jpg, .jpeg, .png, .pdf">
	</div>
	  -->
	  
       
          <div class="modal-footer mt-3">
			    <button type="submit" class="btn btn-primary" style="width:150px" onClick="return validateForm();" >Submit</button>
				    
		</div>
	  
	  
	</form>
	
	</div>
		<div class="go-back-button" style="margin-left:250px; padding-top:20px; padding-bottom : 20px">
		 <a href="landingPage.jsp"><button class="btn btn-danger" style="margin-top:5px">Go to home page</button></a>
		 <a href="viewPatientTestResult.jsp"><button class="btn " style="margin-top:5px;background-color:dodgerblue;color:white">See patient test results</button></a>
		</div>
		<!--	<label>Patient name</label>
		<input type = "text" placeholder="Enter patient name"> </br></br> 
	<input type = "text" name="reportType"> -->
	
		
     <!--  	<label for="file">Select a file to upload:</label>
        <input type="file" name="file" id="file" accept=".jpg, .jpeg, .png, .pdf">
        <input type="submit" value="Upload File" > 
        </br></br> -->
        
        <script>
        function showSuccessMessage() {
		  // Check if a success message is available in the request attributes
		  var successMessage = '<%= request.getAttribute("successMessage") %>';

		  // If a success message is available, show an alert and then refresh the page
		  console.log("the messgae is" + successMessage);
		  
		  if (successMessage === "success") {
		    alert("Data added successfully!");
		    location.reload(); // Refresh the page
		  }else if(successMessage === "error"){
			  alert("Error occured while saving data.Try again!!");
			  location.reload(); // Refresh the page 
		  }
        }
		</script>
		
		<script>
	        function clearForm() {
	            // Reset the form to clear all input fields and reset dropdowns to their initial state.
	         
	        	setTimeout(function() {
	                document.getElementById("testResultForm").reset();
	            }, 10);
           	  
	        }
	    </script>
	    
	    
	    <script>
    function validateForm() {
        // Get the NIC input value
        var nic = document.getElementById("textNIC").value;

        // Get the selected report type
        var reportType = document.getElementById("selectReportType").value;

        // Check if the NIC has less than 10 characters
        if (nic.length < 10) {
            // Display the NIC error message
            document.getElementById("nicError").innerHTML = "Please enter a valid NIC (at least 10 characters).";
            return false; // Prevent form submission
        } else {
            // Clear the NIC error message if the NIC is valid
            document.getElementById("nicError").innerHTML = "";
        }

        // Check if a report type is selected
        if (reportType === "Open this select type") {
            // Display the report type error message
            document.getElementById("reportTypeError").innerHTML = "Please select a report type.";
            return false; // Prevent form submission
        } else {
            // Clear the report type error message if a report type is selected
            document.getElementById("reportTypeError").innerHTML = "";
        }

        return true; // Allow form submission if both conditions are met
    }
</script>

	    
</body>
</html>
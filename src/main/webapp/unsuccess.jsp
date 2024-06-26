<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
	crossorigin="anonymous">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/success.css">
</head>
<body>

	<div class="around-container">
	<h5>Error occured while saving data! try again shortly.</h5>
	<button onclick="goBack()" class="back-to-home-button">Go Back</button>
	</div>
	<script>
		function goBack() {
			window.history.back();
		}
	</script>

</body>
</html>
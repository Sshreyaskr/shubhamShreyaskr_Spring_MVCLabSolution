<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
	
<title>Save student</title>
</head>
<body>

    <div class="container">
       
          <h3>Student Directory</h3>
          <hr>
          
          
          <p class="h4 mb-4">Student Employee</p>

		<form action="/StudentManagement/student/save" method="POST">

			<!-- Add hidden form field to handle update -->
			<input type="hidden" name="id" value="${student.id}" />

			<div class="form-inline">
				<input type="text" name="firstName" value="${student.firstName}"
					class="form-control mb-4 col-4" placeholder="FirstName">
			</div>
			
			
			<div class="form-inline">
				<input type="text" name="lastName" value="${student.lastName}"
					class="form-control mb-4 col-4" placeholder="LastName">
			</div>

			<div class="form-inline">
				<input type="text" name="department" value="${student.department}"
					class="form-control mb-4 col-4" placeholder="Department">
			</div>

			<div class="form-inline">
				<input type="text" name="country" value="${student.country}"
					class="form-control mb-4 col-4" placeholder="country">
			</div>      
    
    		<button type="submit" class="btn btn-info col-2">Save</button>
    
    	</form>
    
       <hr>
       <a href="/StudentManagement/student/list">Back to Students List</a>
    
    </div>

</body>
</html>
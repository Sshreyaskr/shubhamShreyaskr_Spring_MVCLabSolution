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
<title>Student Directory</title>
</head>
<body>
    <div class="container">
    
        <h3>This is the student directory page</h2>
        <hr>
        
        
        <a href="/StudentManagement/student/showFormForAdd"
				class="btn btn-primary btn-sm mb-3"> Add Student </a> 
				
				
				
				
	   <table class="table table-hover table-dark">
			<thead class="thead-light">
				<tr>
				    <th>#</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Department</th>
					<th>Country</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${Students}" var="tempStudent">
					<tr>
					    <td><c:out value="${tempStudent.id}" /></td>
						<td><c:out value="${tempStudent.firstName}" /></td>
						<td><c:out value="${tempStudent.lastName}" /></td>
						<td><c:out value="${tempStudent.department}" /></td>
						<td><c:out value="${tempStudent.country}" /></td>
						<td>
							<!-- Add "update" button/link --> 
							<a href="/StudentManagement/student/showFormForUpdate?studentId=${tempStudent.id}"
							class="btn btn-info btn-sm"> Update </a> 
							
							<!-- Add "delete" button/link -->
							<a href="/StudentManagement/student/delete?studentId=${tempStudent.id}"
							class="btn btn-danger btn-sm"
							onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false">
								Delete </a>

						</td>

					</tr>
				</c:forEach>

			</tbody>
		</table>	
    
    
    
    
    
    
    </div>
</body>
</html>
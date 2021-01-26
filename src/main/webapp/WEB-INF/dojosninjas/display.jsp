<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DojoPage</title>
</head>
<body>
	
	<h1><c:out value="${dojo.name}" /> Ninjas</h1>
	<table>
		<thead>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Age</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${dojo.ninjas}" var="n">
				<tr>
					<td><c:out value="${n.firstName}" /></td>
					<td><c:out value="${n.lastName}" /></td>
					<td><c:out value="${n.age}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>
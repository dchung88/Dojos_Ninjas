<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Dojo</title>
</head>
<body>

	<h1>New Dojo</h1>
	<form:form action="/addingdojo" method="POST" modelAttribute="dojoObject">
		<h3>
			<form:label path="name">Name:</form:label>
			<form:input path="name"/>
		</h3>
		<input type="submit" value="Create"/>
	</form:form>
	<form:errors path="dojoObject.*"/>

</body>
</html>
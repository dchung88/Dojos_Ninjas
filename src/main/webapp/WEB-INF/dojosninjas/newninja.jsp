<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Ninja</title>
</head>
<body>

	<form:form action="/addingninja" method="POST" modelAttribute="ninjaObject">
		
		<form:select path="dojo">
			<c:forEach items="${dojos}" var="d">
				<form:option value="${d}"><c:out value="${d.name}"/></form:option>
			</c:forEach>
		</form:select>
		
		<h3>
			<form:label path="firstName">First Name:</form:label>
			<form:input path="firstName"/>
		</h3>
		<h3>
			<form:label path="lastName">Last Name:</form:label>
			<form:input path="lastName"/>
		</h3>
		<h3>
			<form:label path="age">Age:</form:label>
			<form:input path="age"/>
		</h3>
		<input type="submit" value="Create"/>
		
	</form:form>
	<form:errors path="ninjaObject.*" />

</body>
</html>
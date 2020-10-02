<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Home Page</title>
</head>
<body>
	<h2>Home Page</h2>
	<hr>
	<p>Tada...this is it!</p>
	<hr>
	<p>
		User:
		<security:authentication property="principal.username" />
	</p>
	<br>
	<p>
		Role(s):
		<security:authentication property="principal.authorities" />
	</p>
	<hr>
	
	<security:authorize access="hasRole('MANAGER')">
		<p><a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a> (Only for Managers)</p>
	</security:authorize>
	<security:authorize access="hasRole('ADMIN')">
		<p><a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a> (Only for Admins)</p>
	</security:authorize>
	
	<hr>
	<!-- logout -->
	<form:form action="${pageContext.request.contextPath}/logout"
		method="post">
		<input type="submit" value="Logout" />
	</form:form>
</body>
</html>
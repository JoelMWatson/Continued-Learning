<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>Home Page</title>
</head>
<body>
	<h2>Home Page</h2>
	<hr />
	<p>Tada...this is it!</p>
	
	<!-- logout -->
	<form:form action="${pageContext.request.contextPath}/logout" method="post">
		<input type="submit" value="Logout" />
	</form:form>
</body>
</html>
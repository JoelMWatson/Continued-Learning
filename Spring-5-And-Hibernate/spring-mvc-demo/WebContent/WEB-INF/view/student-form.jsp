<!-- import spring form tags -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>

<head>

	<title>Student Registration Form Demo</title>
	
</head>

<body>

<form:form action="processForm" modelAttribute="student">

	First name: <form:input path="firstName" />
	<br>
	<br>
	
	Last name: <form:input path="lastName" />
	<br>
	<br>
	
	Country: 
	<form:select path="country">
		<!-- hard coded option: <form:option value="USA" label="USA" /> -->
		<form:options items="${student.countryOptions}" />
	</form:select>
	<br>
	<br>
	
	Favorite Language: 
	PHP <form:radiobutton path="favoriteLanguage" value="PHP" />
	Java <form:radiobutton path="favoriteLanguage" value="Java" />
	JavaScript <form:radiobutton path="favoriteLanguage" value="JavaScript" />
	Ruby <form:radiobutton path="favoriteLanguage" value="Ruby" />
	<br>
	<br>
	
	Known Operating Systems: 
	Linux <form:checkbox path="operatingSystems" value="Linux" />
	MAC OS <form:checkbox path="operatingSystems" value="MAC OS" />
	MS Windows <form:checkbox path="operatingSystems" value="MS Windows" />
	<br>
	<br>
	
	<input type="submit" value="Submit" />
	
</form:form>

</body>

</html>
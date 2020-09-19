<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Customer Confirmation</title>
</head>
<body>
	<p>The customer is confirmed: ${customer.firstName}
		${customer.lastName}.</p>
	<p>Free passes: ${customer.freePasses}</p>
	<p>Postal Code: ${customer.postalCode}</p>
	<p>Course Code: ${customer.courseCode}</p>
</body>
</html>

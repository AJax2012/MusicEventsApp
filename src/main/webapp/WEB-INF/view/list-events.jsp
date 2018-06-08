<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Event Listings</h2>
		</div>
	</div>

	<div id="container">
		<div id="content">
			<!-- html table here -->
			<table>
				<tr>
					<th>Event Venue</th>
				</tr>

				<!-- loops over events -->
				<c:forEach var="tempEvent" items="${events}">
					<tr>
						<td>${tempEvent.venue}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>